import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/services/replay_gain_service.dart';
import 'package:musly/services/auto_dj_service.dart';
import 'package:musly/services/transcoding_service.dart';
import 'package:musly/services/storage_service.dart';
import 'package:musly/services/fade_settings_service.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/widgets/settings/settings_section_card.dart';
import 'package:musly/widgets/settings/settings_switch_tile.dart';
import 'package:musly/widgets/settings/settings_list_tile.dart';
import 'package:musly/widgets/settings/settings_icon_badge.dart';
import 'package:musly/utils/context_extensions.dart';

import 'package:musly/services/crossfade_service.dart';
import 'package:musly/services/player_ui_settings_service.dart';

class SettingsPlaybackTab extends StatefulWidget {
  const SettingsPlaybackTab({super.key});

  @override
  State<SettingsPlaybackTab> createState() => _SettingsPlaybackTabState();
}

class _SettingsPlaybackTabState extends State<SettingsPlaybackTab> {
  final _replayGainService = ReplayGainService();
  final _fadeSettingsService = FadeSettingsService();
  final _crossfadeService = CrossfadeService();

  ReplayGainMode _replayGainMode = ReplayGainMode.off;
  double _replayGainPreamp = 0.0;
  bool _replayGainPreventClipping = true;
  double _replayGainFallback = -6.0;
  bool _lrcLibFallback = true;
  AutoDjMode _autoDjMode = AutoDjMode.off;
  int _autoDjSongsToAdd = 5;
  bool _fadeEnabled = false;
  int _fadeDurationMs = 300;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    await _replayGainService.initialize();
    await _fadeSettingsService.initialize();
    await _crossfadeService.initialize();

    final storageService = StorageService();
    final lrcLibFallback = await storageService.getLrcLibFallback();
    setState(() {
      _replayGainMode = _replayGainService.getMode();
      _replayGainPreamp = _replayGainService.getPreampGain();
      _replayGainPreventClipping = _replayGainService.getPreventClipping();
      _replayGainFallback = _replayGainService.getFallbackGain();
      _lrcLibFallback = lrcLibFallback;
      _autoDjMode = playerProvider.autoDjService.mode;
      _autoDjSongsToAdd = playerProvider.autoDjService.songsToAdd;
      _fadeEnabled = _fadeSettingsService.getFadeEnabled();
      _fadeDurationMs = _fadeSettingsService.getFadeDurationMs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isYoutube =
        Provider.of<SubsonicService>(context, listen: false).isYoutube;

    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 48),
      children: [
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionAutoDj,
          children: [
            _buildAutoDjModeSelector(),
            if (_autoDjMode != AutoDjMode.off) ...[
              const SettingsDivider(),
              _buildAutoDjSongsSlider(),
            ],
          ],
        ),
        const SizedBox(height: 24),
        _buildCrossfadeSection(),
        const SizedBox(height: 24),
        _buildGaplessSection(),
        const SizedBox(height: 24),
        _buildFadeSection(),
        const SizedBox(height: 24),
        _buildLrcLibSection(),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionVolumeNormalization,
          children: [
            _buildReplayGainModeSelector(),
            if (_replayGainMode != ReplayGainMode.off) ...[
              const SettingsDivider(),
              _buildReplayGainPreampSlider(),
              const SettingsDivider(),
              _buildReplayGainClippingToggle(),
              const SettingsDivider(),
              _buildReplayGainFallbackSlider(),
            ],
          ],
        ),
        const SizedBox(height: 24),
        _buildAdvancedPlaybackSection(),
        if (!isYoutube) ...[
          const SizedBox(height: 24),
          _buildTranscodingSection(),
        ],
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildAdvancedPlaybackSection() {
    final player = Provider.of<PlayerProvider>(context);
    final uiSettings = PlayerUiSettingsService();
    final accent = Theme.of(context).colorScheme.primary;

    return SettingsSectionCard(
      title: '播放增强与控制 (Salt Player 风格)',
      children: [
        SettingsListTile(
          gradientColors: [accent, accent.withValues(alpha: 0.6)],
          icon: Icons.speed_rounded,
          title: '默认播放倍速',
          subtitle: '当前: ${player.playbackSpeed.toStringAsFixed(2)}x',
          trailing: DropdownButton<double>(
            value: [0.75, 1.0, 1.25, 1.5, 2.0].contains(player.playbackSpeed)
                ? player.playbackSpeed
                : 1.0,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: 0.75, child: Text('0.75x')),
              DropdownMenuItem(value: 1.0, child: Text('1.0x (正常)')),
              DropdownMenuItem(value: 1.25, child: Text('1.25x')),
              DropdownMenuItem(value: 1.5, child: Text('1.5x')),
              DropdownMenuItem(value: 2.0, child: Text('2.0x')),
            ],
            onChanged: (spd) {
              if (spd != null) player.setPlaybackSpeed(spd);
            },
          ),
        ),
        const SettingsDivider(),
        SettingsSwitchTile(
          gradientColors: const [Color(0xFF6366F1), Color(0xFF8B5CF6)],
          icon: Icons.music_note_rounded,
          title: AppLocalizations.of(context)!.preservePitch,
          subtitle: AppLocalizations.of(context)!.preservePitchSubtitle,
          value: player.pitchCorrection,
          onChanged: (_) => player.togglePitchCorrection(),
        ),
        const SettingsDivider(),
        ValueListenableBuilder<int>(
          valueListenable: uiSettings.seekStepSecondsNotifier,
          builder: (context, seekStep, _) {
            return SettingsListTile(
              gradientColors: const [Color(0xFF3B82F6), Color(0xFF06B6D4)],
              icon: Icons.fast_forward_rounded,
              title: '快进 / 快退步长',
              subtitle: '$seekStep 秒',
              trailing: DropdownButton<int>(
                value: [5, 10, 15, 30].contains(seekStep) ? seekStep : 10,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: 5, child: Text('5 秒')),
                  DropdownMenuItem(value: 10, child: Text('10 秒 (默认)')),
                  DropdownMenuItem(value: 15, child: Text('15 秒')),
                  DropdownMenuItem(value: 30, child: Text('30 秒')),
                ],
                onChanged: (v) {
                  if (v != null) uiSettings.setSeekStepSeconds(v);
                },
              ),
            );
          },
        ),
        const SettingsDivider(),
        ValueListenableBuilder<bool>(
          valueListenable: uiSettings.hapticFeedbackNotifier,
          builder: (context, haptic, _) {
            return SettingsSwitchTile(
              gradientColors: const [Color(0xFFF59E0B), Color(0xFFD97706)],
              icon: Icons.vibration_rounded,
              title: '触觉震动反馈',
              subtitle: '在切歌、调节进度与点击控制时提供振动提示',
              value: haptic,
              onChanged: (v) => uiSettings.setHapticFeedback(v),
            );
          },
        ),
        const SettingsDivider(),
        ValueListenableBuilder<int>(
          valueListenable: uiSettings.lyricsSyncOffsetMsNotifier,
          builder: (context, offset, _) {
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              leading: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.sync_alt_rounded,
                    color: Color(0xFF10B981), size: 18),
              ),
              title: const Text('歌词时序微调预设', style: TextStyle(fontSize: 16)),
              subtitle: Text(
                offset == 0
                    ? '标准同步 (0ms)'
                    : '${offset > 0 ? '+' : ''}${offset}ms',
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppTheme.darkSecondaryText
                      : AppTheme.lightSecondaryText,
                ),
              ),
              trailing: TextButton(
                onPressed: () async =>
                    await uiSettings.setLyricsSyncOffsetMs(0),
                child: const Text('重置为 0'),
              ),
            );
          },
        ),
        const SettingsDivider(),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF8B5CF6).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.bedtime_rounded,
                color: Color(0xFF8B5CF6), size: 18),
          ),
          title: Text(AppLocalizations.of(context)!.sleepTimer,
              style: const TextStyle(fontSize: 16)),
          subtitle: Text(
            player.hasSleepTimer
                ? (player.sleepTimerRemaining != null
                    ? '倒计时剩余: ${player.sleepTimerRemaining!.inMinutes} 分钟'
                    : '本曲目播放完毕后停止')
                : '未开启',
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppTheme.darkSecondaryText
                  : AppTheme.lightSecondaryText,
            ),
          ),
          trailing: DropdownButton<int>(
            value: player.hasSleepTimer ? (player.sleepTimerRemaining?.inMinutes ?? -1) : 0,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: 0, child: Text('关闭')),
              DropdownMenuItem(value: 15, child: Text('15 分钟')),
              DropdownMenuItem(value: 30, child: Text('30 分钟')),
              DropdownMenuItem(value: 45, child: Text('45 分钟')),
              DropdownMenuItem(value: 60, child: Text('60 分钟')),
              DropdownMenuItem(value: -1, child: Text('本曲播完')),
            ],
            onChanged: (mins) {
              if (mins == null) return;
              if (mins == 0) {
                player.cancelSleepTimer();
              } else if (mins == -1) {
                player.setSleepTimer(Duration.zero, endCurrentSong: true, fadeOut: true);
              } else {
                player.setSleepTimer(Duration(minutes: mins), fadeOut: true);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAutoDjModeSelector() {
    return SettingsListTile(
      gradientColors: const [Color(0xFFFF2D55), Color(0xFFFF6B6B)],
      icon: CupertinoIcons.wand_stars,
      title: AppLocalizations.of(context)!.autoDjMode,
      trailing: DropdownButton<AutoDjMode>(
        value: _autoDjMode,
        underline: const SizedBox(),
        items: AutoDjMode.values.map((mode) {
          return DropdownMenuItem(
            value: mode,
            child: Text(_getAutoDjModeLabel(mode)),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) _setAutoDjMode(value);
        },
      ),
    );
  }

  String _getAutoDjModeLabel(AutoDjMode mode) {
    return AutoDjService.getModeDisplayName(mode);
  }

  void _setAutoDjMode(AutoDjMode mode) {
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    playerProvider.autoDjService.setMode(mode);
    setState(() => _autoDjMode = mode);
  }

  Widget _buildAutoDjSongsSlider() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: SettingsIconBadge(
        gradientColors: const [Color(0xFF5856D6), Color(0xFF7B68EE)],
        icon: CupertinoIcons.music_note_list,
      ),
      title: Text(
        AppLocalizations.of(context)!.autoDjSongsToAdd(_autoDjSongsToAdd),
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Slider(
        value: _autoDjSongsToAdd.toDouble(),
        min: 1,
        max: 20,
        divisions: 19,
        activeColor: Theme.of(context).colorScheme.primary,
        onChanged: (value) {
          final count = value.round();
          final playerProvider = Provider.of<PlayerProvider>(
            context,
            listen: false,
          );
          playerProvider.autoDjService.setSongsToAdd(count);
          setState(() => _autoDjSongsToAdd = count);
        },
      ),
    );
  }

  Widget _buildReplayGainModeSelector() {
    return SettingsListTile(
      gradientColors: const [Color(0xFF34C759), Color(0xFF30D158)],
      icon: CupertinoIcons.speaker_2,
      title: AppLocalizations.of(context)!.replayGainMode,
      trailing: DropdownButton<ReplayGainMode>(
        value: _replayGainMode,
        underline: const SizedBox(),
        items: ReplayGainMode.values.map((mode) {
          return DropdownMenuItem(
            value: mode,
            child: Text(_getReplayGainModeLabel(mode)),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) _setReplayGainMode(value);
        },
      ),
    );
  }

  String _getReplayGainModeLabel(ReplayGainMode mode) {
    final l10n = AppLocalizations.of(context)!;
    switch (mode) {
      case ReplayGainMode.off:
        return l10n.replayGainModeOff;
      case ReplayGainMode.track:
        return l10n.replayGainModeTrack;
      case ReplayGainMode.album:
        return l10n.replayGainModeAlbum;
    }
  }

  void _setReplayGainMode(ReplayGainMode mode) async {
    await _replayGainService.setMode(mode);
    setState(() => _replayGainMode = mode);
  }

  Widget _buildReplayGainPreampSlider() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(AppLocalizations.of(context)!
          .replayGainPreamp(_replayGainPreamp.toStringAsFixed(1))),
      subtitle: Slider(
        value: _replayGainPreamp,
        min: -12,
        max: 12,
        divisions: 24,
        activeColor: Theme.of(context).colorScheme.primary,
        onChanged: (value) async {
          await _replayGainService.setPreampGain(value);
          setState(() => _replayGainPreamp = value);
        },
      ),
    );
  }

  Widget _buildReplayGainClippingToggle() {
    return SettingsSwitchTile(
      title: AppLocalizations.of(context)!.replayGainPreventClipping,
      value: _replayGainPreventClipping,
      onChanged: (value) async {
        await _replayGainService.setPreventClipping(value);
        setState(() => _replayGainPreventClipping = value);
      },
    );
  }

  Widget _buildReplayGainFallbackSlider() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(
        AppLocalizations.of(context)!
            .replayGainFallbackGain(_replayGainFallback.toStringAsFixed(1)),
      ),
      subtitle: Slider(
        value: _replayGainFallback,
        min: -12,
        max: 0,
        divisions: 12,
        activeColor: Theme.of(context).colorScheme.primary,
        onChanged: (value) async {
          await _replayGainService.setFallbackGain(value);
          setState(() => _replayGainFallback = value);
        },
      ),
    );
  }

  Widget _buildLrcLibSection() {
    final accent = Theme.of(context).colorScheme.primary;
    final l10n = AppLocalizations.of(context)!;
    return SettingsSectionCard(
      title: l10n.sectionLyrics,
      children: [
        SettingsSwitchTile(
          gradientColors: [accent, accent.withValues(alpha: 0.6)],
          icon: CupertinoIcons.text_quote,
          title: AppLocalizations.of(context)!.enableLrcLibFallback,
          subtitle: AppLocalizations.of(context)!.lrcLibFallbackSubtitle,
          value: _lrcLibFallback,
          onChanged: (v) async {
            final storage = StorageService();
            await storage.saveLrcLibFallback(v);
            setState(() => _lrcLibFallback = v);
          },
        ),
      ],
    );
  }

  Widget _buildCrossfadeSection() {
    final accent = Theme.of(context).colorScheme.primary;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final crossfadeSec = _crossfadeService.getCrossfadeSeconds();

    return SettingsSectionCard(
      title: l10n.sectionSmartCrossfade,
      children: [
        SettingsListTile(
          gradientColors: [accent, accent.withValues(alpha: 0.6)],
          icon: CupertinoIcons.slider_horizontal_below_rectangle,
          title: l10n.trackCrossfade,
          subtitle: crossfadeSec == 0
              ? l10n.crossfadeOffSubtitle
              : l10n.crossfadeDurationSubtitle(crossfadeSec),
          trailing: Text(
            crossfadeSec == 0
                ? l10n.replayGainModeOff
                : l10n.crossfadeDurationBadge(crossfadeSec),
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: accent),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Slider(
                value: crossfadeSec.toDouble(),
                min: 0,
                max: 12,
                divisions: 12,
                activeColor: accent,
                onChanged: (value) async {
                  final sec = value.round();
                  await _crossfadeService.setCrossfadeSeconds(sec);
                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.replayGainModeOff,
                      style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white38 : Colors.black38)),
                  Text(l10n.crossfadeDurationBadge(6),
                      style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white38 : Colors.black38)),
                  Text(l10n.crossfadeDurationBadge(12),
                      style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white38 : Colors.black38)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGaplessSection() {
    return Consumer<PlayerProvider>(
      builder: (context, player, _) {
        final accent = Theme.of(context).colorScheme.primary;
        final l10n = AppLocalizations.of(context)!;
        return SettingsSectionCard(
          title: l10n.sectionGaplessPlayback,
          children: [
            SettingsSwitchTile(
              gradientColors: [accent, accent.withValues(alpha: 0.6)],
              icon: CupertinoIcons.link,
              title: l10n.gaplessPlayback,
              subtitle: l10n.gaplessPlaybackSubtitle,
              value: player.gaplessEnabled,
              onChanged: (_) => player.toggleGaplessPlayback(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFadeSection() {
    final l10n = AppLocalizations.of(context)!;
    return SettingsSectionCard(
      title: l10n.sectionFadeInOut,
      children: [
        SettingsSwitchTile(
          gradientColors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
          ],
          icon: CupertinoIcons.waveform,
          title: l10n.fadeInOutEnable,
          subtitle: l10n.fadeInOutSubtitle,
          value: _fadeEnabled,
          onChanged: (v) async {
            await _fadeSettingsService.setFadeEnabled(v);
            setState(() => _fadeEnabled = v);
          },
        ),
        if (_fadeEnabled) ...[
          const SettingsDivider(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            title: Text(
              l10n.fadeDuration(_fadeDurationMs),
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Slider(
              value: _fadeDurationMs.toDouble(),
              min: 100,
              max: 1000,
              divisions: 18,
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged: (value) async {
                final duration = value.round();
                await _fadeSettingsService.setFadeDurationMs(duration);
                setState(() => _fadeDurationMs = duration);
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTranscodingSection() {
    return Consumer<TranscodingService>(
      builder: (context, ts, _) {
        final accent = Theme.of(context).colorScheme.primary;
        final secondaryText = context.isDark
            ? AppTheme.darkSecondaryText
            : AppTheme.lightSecondaryText;

        Widget connectionBadge() {
          final isWifi = ts.currentConnectionType == ConnectionType.wifi;
          final l10n = AppLocalizations.of(context)!;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: (isWifi ? Colors.green : Colors.orange)
                  .withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isWifi ? Icons.wifi_rounded : Icons.signal_cellular_alt,
                  size: 12,
                  color: isWifi ? Colors.green : Colors.orange,
                ),
                const SizedBox(width: 4),
                Text(
                  isWifi ? l10n.networkWifi : l10n.networkMobile,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isWifi ? Colors.green : Colors.orange,
                  ),
                ),
              ],
            ),
          );
        }

        return SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionStreamingQuality,
          children: [
            SettingsSwitchTile(
              gradientColors: const [Color(0xFFFF9500), Color(0xFFFF3B30)],
              icon: CupertinoIcons.waveform,
              title: AppLocalizations.of(context)!.transcodingEnable,
              subtitle: AppLocalizations.of(context)!.transcodingEnableSubtitle,
              value: ts.enabled,
              onChanged: (v) => ts.setEnabled(v),
            ),
            if (ts.enabled) ...[
              const SettingsDivider(),
              SettingsSwitchTile(
                gradientColors: [accent, accent.withValues(alpha: 0.6)],
                icon: Icons.auto_fix_high_rounded,
                title: AppLocalizations.of(context)!.smartTranscoding,
                subtitle: AppLocalizations.of(context)!.smartTranscodingSubtitle,
                value: ts.smartEnabled,
                onChanged: (v) => ts.setSmartEnabled(v),
              ),
              if (ts.smartEnabled)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!
                              .smartTranscodingDetectedNetwork,
                          style: TextStyle(fontSize: 12, color: secondaryText),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      connectionBadge(),
                      const Spacer(),
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!
                              .smartTranscodingActiveBitrate(
                            ts.getCurrentBitrate() != null
                                ? '${ts.getCurrentBitrate()} kbps'
                                : AppLocalizations.of(context)!
                                    .transcodingFormatOriginal,
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              const SettingsDivider(),
              SettingsListTile(
                leading: const Icon(Icons.wifi_rounded, size: 20),
                title: AppLocalizations.of(context)!.transcodingWifiQuality,
                subtitle: ts.smartEnabled
                    ? AppLocalizations.of(context)!
                        .transcodingWifiQualitySubtitleSmart
                    : AppLocalizations.of(context)!
                        .transcodingWifiQualitySubtitle,
                trailing: DropdownButton<int>(
                  value: ts.wifiBitrate,
                  underline: const SizedBox(),
                  items: TranscodeBitrate.options.map((bitrate) {
                    final label = bitrate == TranscodeBitrate.original
                        ? AppLocalizations.of(context)!
                            .transcodingBitrateOriginal
                        : '$bitrate kbps';
                    return DropdownMenuItem(value: bitrate, child: Text(label));
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) ts.setWifiBitrate(v);
                  },
                ),
              ),
              const SettingsDivider(),
              SettingsListTile(
                leading: const Icon(
                  Icons.signal_cellular_alt_rounded,
                  size: 20,
                ),
                title: AppLocalizations.of(context)!.transcodingMobileQuality,
                subtitle: ts.smartEnabled
                    ? AppLocalizations.of(context)!
                        .transcodingMobileQualitySubtitleSmart
                    : AppLocalizations.of(context)!
                        .transcodingMobileQualitySubtitle,
                trailing: DropdownButton<int>(
                  value: ts.mobileBitrate,
                  underline: const SizedBox(),
                  items: TranscodeBitrate.options.map((bitrate) {
                    final label = bitrate == TranscodeBitrate.original
                        ? AppLocalizations.of(context)!
                            .transcodingBitrateOriginal
                        : '$bitrate kbps';
                    return DropdownMenuItem(value: bitrate, child: Text(label));
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) ts.setMobileBitrate(v);
                  },
                ),
              ),
              const SettingsDivider(),
              SettingsListTile(
                leading: const Icon(Icons.audio_file_rounded, size: 20),
                title: AppLocalizations.of(context)!.transcodingFormat,
                subtitle: AppLocalizations.of(context)!.transcodingFormatSubtitle,
                trailing: DropdownButton<String>(
                  value: ts.format,
                  underline: const SizedBox(),
                  items: TranscodeFormat.options.map((format) {
                    final label = format == TranscodeFormat.original
                        ? AppLocalizations.of(context)!
                            .transcodingFormatOriginal
                        : format.toUpperCase();
                    return DropdownMenuItem(value: format, child: Text(label));
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) ts.setFormat(v);
                  },
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
