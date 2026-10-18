import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/player_provider.dart';
import '../../services/player_ui_settings_service.dart';
import '../../l10n/app_localizations.dart';

class NowPlayingMoreMenu extends StatefulWidget {
  const NowPlayingMoreMenu({super.key});

  @override
  State<NowPlayingMoreMenu> createState() => _NowPlayingMoreMenuState();
}

class _NowPlayingMoreMenuState extends State<NowPlayingMoreMenu> {
  final _uiSettings = PlayerUiSettingsService();
  int _lyricsOffset = 0;

  @override
  void initState() {
    super.initState();
    _lyricsOffset = _uiSettings.getLyricsSyncOffsetMs();
  }

  void _adjustOffset(int deltaMs) async {
    final newOffset = (_lyricsOffset + deltaMs).clamp(-10000, 10000);
    setState(() => _lyricsOffset = newOffset);
    await _uiSettings.setLyricsSyncOffsetMs(newOffset);
  }

  void _resetOffset() async {
    setState(() => _lyricsOffset = 0);
    await _uiSettings.setLyricsSyncOffsetMs(0);
  }

  void _setSleepTimer(
      BuildContext context, int minutes, PlayerProvider provider) {
    if (minutes == 0) {
      provider.setSleepTimer(Duration.zero, endCurrentSong: false);
    } else if (minutes == -1) {
      provider.setSleepTimer(Duration.zero, endCurrentSong: true);
    } else {
      provider.setSleepTimer(Duration(minutes: minutes), endCurrentSong: false);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E22) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(bottom: 32, top: 16),
      child: Consumer<PlayerProvider>(
        builder: (context, provider, child) {
          final sleepTimerRemaining = provider.sleepTimerRemaining;
          final sleepTimerEndCurrentSong = provider.sleepTimerEndCurrentSong;

          String sleepTimerText = "关";
          if (sleepTimerEndCurrentSong) {
            sleepTimerText = AppLocalizations.of(context)!.endOfSong;
          } else if (sleepTimerRemaining != null) {
            final minutes = sleepTimerRemaining.inMinutes;
            final seconds =
                (sleepTimerRemaining.inSeconds % 60).toString().padLeft(2, '0');
            sleepTimerText = "$minutes:$seconds";
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.timer_outlined),
                  title: Text(AppLocalizations.of(context)!.sleepTimer),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        sleepTimerText,
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => SimpleDialog(
                        title: Text(AppLocalizations.of(context)!.sleepTimer),
                        children: [
                          SimpleDialogOption(
                            child: Text(AppLocalizations.of(context)!.timerOff),
                            onPressed: () => _setSleepTimer(context, 0, provider),
                          ),
                          SimpleDialogOption(
                            child: Text(AppLocalizations.of(context)!
                                .sleepTimerMinutes(5)),
                            onPressed: () => _setSleepTimer(context, 5, provider),
                          ),
                          SimpleDialogOption(
                            child: Text(AppLocalizations.of(context)!
                                .sleepTimerMinutes(15)),
                            onPressed: () =>
                                _setSleepTimer(context, 15, provider),
                          ),
                          SimpleDialogOption(
                            child: Text(AppLocalizations.of(context)!
                                .sleepTimerMinutes(30)),
                            onPressed: () =>
                                _setSleepTimer(context, 30, provider),
                          ),
                          SimpleDialogOption(
                            child: Text(AppLocalizations.of(context)!.endOfSong),
                            onPressed: () =>
                                _setSleepTimer(context, -1, provider),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const Divider(indent: 56),
                // Playback speed section with quick pills
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.speed_rounded, size: 20),
                              const SizedBox(width: 12),
                              Text(AppLocalizations.of(context)!.playbackSpeed,
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                          Text(
                            "${provider.playbackSpeed.toStringAsFixed(2)}x",
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [0.75, 1.0, 1.25, 1.5, 2.0].map((spd) {
                          final isSelected = (provider.playbackSpeed - spd).abs() < 0.05;
                          return ChoiceChip(
                            label: Text("${spd}x"),
                            selected: isSelected,
                            onSelected: (_) => provider.setPlaybackSpeed(spd),
                            selectedColor:
                                theme.colorScheme.primary.withValues(alpha: 0.25),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              fontWeight:
                                  isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : null,
                            ),
                          );
                        }).toList(),
                      ),
                      Slider(
                        value: provider.playbackSpeed,
                        min: 0.5,
                        max: 2.0,
                        divisions: 15,
                        onChanged: (val) {
                          provider.setPlaybackSpeed(val);
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(indent: 56),
                // Lyrics offset section (Salt Player style sync)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.sync_alt_rounded, size: 20),
                              SizedBox(width: 12),
                              Text("歌词快慢微调", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Text(
                            _lyricsOffset == 0
                                ? "精准对齐 (0ms)"
                                : "${_lyricsOffset > 0 ? '+' : ''}${_lyricsOffset}ms",
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildOffsetButton("-0.5s", () => _adjustOffset(-500)),
                          _buildOffsetButton("-0.1s", () => _adjustOffset(-100)),
                          _buildOffsetButton("重置", _resetOffset, isReset: true),
                          _buildOffsetButton("+0.1s", () => _adjustOffset(100)),
                          _buildOffsetButton("+0.5s", () => _adjustOffset(500)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(indent: 56),
                SwitchListTile(
                  secondary: const Icon(Icons.music_note_rounded),
                  title: Text(AppLocalizations.of(context)!.preservePitch),
                  subtitle:
                      Text(AppLocalizations.of(context)!.preservePitchSubtitle),
                  value: provider.pitchCorrection,
                  onChanged: (val) {
                    provider.togglePitchCorrection();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOffsetButton(String text, VoidCallback onTap,
      {bool isReset = false}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isReset
                ? Colors.grey.withValues(alpha: 0.15)
                : Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isReset
                  ? Colors.grey.withValues(alpha: 0.3)
                  : Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isReset ? null : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
