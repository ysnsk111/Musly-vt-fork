import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:musly/models/song.dart';
import 'package:musly/models/artist_ref.dart';
import 'package:musly/models/radio_station.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/services/player_ui_settings_service.dart';
import 'package:musly/utils/screen_helper.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/widgets/common/album_artwork.dart';
import 'package:musly/screens/player/now_playing_screen.dart';

class MiniPlayer extends StatelessWidget {
  final VoidCallback? onTap;

  const MiniPlayer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
    if (isDesktop) return const SizedBox.shrink();

    return Selector<PlayerProvider, (Song?, RadioStation?, bool)>(
      selector: (_, p) =>
          (p.currentSong, p.currentRadioStation, p.isPlayingRadio),
      builder: (context, data, _) {
        final (currentSong, currentRadioStation, isPlayingRadio) = data;

        void handleTap() {
          if (onTap != null) {
            onTap!();
            return;
          }
          if (currentSong != null) {
            final subsonic =
                Provider.of<SubsonicService>(context, listen: false);
            final coverUrl = currentSong.coverArt != null
                ? subsonic.getCoverArtUrl(currentSong.coverArt, size: 600)
                : null;
            final imageProvider = (coverUrl != null && coverUrl.isNotEmpty)
                ? CachedNetworkImageProvider(coverUrl) as ImageProvider
                : const AssetImage('assets/logo.png') as ImageProvider;
            final topPadding = MediaQuery.of(context).padding.top;

            Navigator.of(context, rootNavigator: true).push(
              PageRouteBuilder(
                opaque: false,
                barrierColor: Colors.black.withValues(alpha: 0.55),
                barrierDismissible: true,
                transitionDuration: const Duration(milliseconds: 380),
                reverseTransitionDuration: const Duration(milliseconds: 320),
                pageBuilder: (ctx, anim, secAnim) => NowPlayingScreen(
                  topPadding: topPadding,
                  image: imageProvider,
                  title: currentSong.title,
                  artist: (currentSong.artistParticipants?.isNotEmpty == true
                          ? currentSong.artistParticipants!
                              .map((a) => a.name)
                              .join(', ')
                          : currentSong.artist) ??
                      '',
                  heroTag: 'cover_${currentSong.id}',
                  song: currentSong,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final curved = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                    reverseCurve: Curves.easeInCubic,
                  );
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation,
                      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
                    ),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.22),
                        end: Offset.zero,
                      ).animate(curved),
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 0.94, end: 1.0)
                            .animate(curved),
                        child: child,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }

        if (currentSong == null && !isPlayingRadio) {
          return const SizedBox.shrink();
        }

        final theme = Theme.of(context);
        final isDark = theme.brightness == Brightness.dark;

        final String title;
        final String? subtitle;
        final String? coverArt;

        if (isPlayingRadio && currentRadioStation != null) {
          title = currentRadioStation.name;
          subtitle = 'Internet Radio • LIVE';
          coverArt = null;
        } else if (currentSong != null) {
          title = currentSong.title;
          subtitle = currentSong.artistParticipants != null &&
                  currentSong.artistParticipants!.isNotEmpty
              ? currentSong.artistParticipants!.map((a) => a.name).join(', ')
              : (currentSong.artist != null
                  ? ArtistRef.splitArtistNames(currentSong.artist!).join(', ')
                  : null);
          coverArt = currentSong.coverArt;
        } else {
          return const SizedBox.shrink();
        }

        final Widget row = _MiniPlayerRow(
          songId: currentSong?.id,
          title: title,
          subtitle: subtitle,
          coverArt: coverArt,
          isPlayingRadio: isPlayingRadio,
        );

        return RepaintBoundary(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 28.0, sigmaY: 28.0),
                child: GestureDetector(
                  onTap: handleTap,
                  onHorizontalDragEnd: (details) {
                    final velocity = details.primaryVelocity ?? 0;
                    if (velocity < -200) {
                      Provider.of<PlayerProvider>(context, listen: false).skipNext();
                      HapticFeedback.mediumImpact();
                    } else if (velocity > 200) {
                      Provider.of<PlayerProvider>(context, listen: false).skipPrevious();
                      HapticFeedback.mediumImpact();
                    }
                  },
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0x991A1A1E)
                          : const Color(0xAAFFFFFF),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.16)
                            : Colors.black.withValues(alpha: 0.08),
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.22),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(child: row),
                        const Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: _MiniPlayerProgressBar(
                              borderRadius: 22, isGlass: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MiniPlayerProgressBar extends StatelessWidget {
  final double borderRadius;
  final bool isGlass;

  const _MiniPlayerProgressBar({
    this.borderRadius = 0,
    this.isGlass = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primary = theme.colorScheme.primary;

    return Selector<PlayerProvider, (double, bool)>(
      selector: (_, p) => (p.progress, p.isPlayingRadio),
      builder: (context, data, _) {
        final (progress, isRadio) = data;
        if (isRadio) return const SizedBox.shrink();

        final cleanProgress = progress.isNaN || progress.isInfinite
            ? 0.0
            : progress.clamp(0.0, 1.0);

        final trackColor = isDark
            ? (isGlass
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.white.withValues(alpha: 0.12))
            : (isGlass
                ? Colors.black.withValues(alpha: 0.06)
                : Colors.black.withValues(alpha: 0.08));

        return ClipRRect(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(borderRadius)),
          child: Container(
            height: 2.5,
            width: double.infinity,
            color: trackColor,
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: cleanProgress,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primary,
                      primary.withValues(alpha: 0.85),
                    ],
                  ),
                  borderRadius: cleanProgress >= 0.98
                      ? BorderRadius.vertical(
                          bottom: Radius.circular(borderRadius))
                      : BorderRadius.zero,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MiniPlayerRow extends StatelessWidget {
  final String? songId;
  final String title;
  final String? subtitle;
  final String? coverArt;
  final bool isPlayingRadio;

  const _MiniPlayerRow({
    this.songId,
    required this.title,
    required this.subtitle,
    required this.coverArt,
    required this.isPlayingRadio,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (isPlayingRadio)
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFF2D55), Color(0xFFFF6B35)],
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.radio, color: Colors.white, size: 24),
            )
          else
            Hero(
              tag: songId != null ? 'cover_$songId' : 'mini_cover',
              child:
                  AlbumArtwork(coverArt: coverArt, size: 44, borderRadius: 6),
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null)
                  Row(
                    children: [
                      if (isPlayingRadio) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 1,
                          ),
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Text(
                            'LIVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      Expanded(
                        child: Text(
                          isPlayingRadio ? 'Internet Radio' : subtitle!,
                          style: theme.textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          _MiniPlayerControls(isRadio: isPlayingRadio),
        ],
      ),
    );
  }
}

class _MiniPlayerControls extends StatelessWidget {
  final bool isRadio;

  const _MiniPlayerControls({this.isRadio = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? Colors.white : Colors.black;

    return Selector<PlayerProvider, (bool, bool)>(
      selector: (_, p) => (p.isPlaying, p.hasNext),
      builder: (context, data, _) {
        final (isPlaying, hasNext) = data;
        final provider = context.read<PlayerProvider>();
        final playerUiSettings = PlayerUiSettingsService();

        return ValueListenableBuilder<bool>(
          valueListenable: playerUiSettings.showMiniPlayerHeartNotifier,
          builder: (context, showHeart, _) {
            return ValueListenableBuilder<bool>(
              valueListenable: playerUiSettings.showMiniPlayerRepeatNotifier,
              builder: (context, showRepeat, _) {
                return ValueListenableBuilder<bool>(
                  valueListenable:
                      playerUiSettings.showMiniPlayerShuffleNotifier,
                  builder: (context, showShuffle, _) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (showHeart && !isRadio)
                          Selector<PlayerProvider, bool>(
                            selector: (_, p) => p.currentSong?.starred == true,
                            builder: (context, isStarred, _) {
                              return IconButton(
                                onPressed: provider.toggleFavorite,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                    minWidth: 36, minHeight: 36),
                                icon: Icon(
                                  isStarred
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,
                                  size:
                                      ScreenHelper.miniPlayerIconSize(context),
                                ),
                                color: isStarred
                                    ? Theme.of(context).colorScheme.primary
                                    : color,
                              );
                            },
                          ),
                        if (showShuffle && !isRadio)
                          Selector<PlayerProvider, bool>(
                            selector: (_, p) => p.shuffleEnabled,
                            builder: (context, shuffleEnabled, _) {
                              return IconButton(
                                onPressed: provider.toggleShuffle,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                    minWidth: 36, minHeight: 36),
                                icon: Icon(
                                  CupertinoIcons.shuffle,
                                  size:
                                      ScreenHelper.miniPlayerIconSize(context),
                                ),
                                color: shuffleEnabled
                                    ? Theme.of(context).colorScheme.primary
                                    : color,
                              );
                            },
                          ),
                        IconButton(
                          onPressed: provider.togglePlayPause,
                          padding: EdgeInsets.zero,
                          constraints:
                              const BoxConstraints(minWidth: 40, minHeight: 40),
                          icon: Icon(
                            isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: ScreenHelper.miniPlayerPlayIconSize(context),
                          ),
                          color: color,
                        ),
                        if (showRepeat && !isRadio)
                          Selector<PlayerProvider, RepeatMode>(
                            selector: (_, p) => p.repeatMode,
                            builder: (context, repeatMode, _) {
                              IconData icon;
                              bool active = repeatMode != RepeatMode.off;
                              if (repeatMode == RepeatMode.one) {
                                icon = CupertinoIcons.repeat_1;
                              } else {
                                icon = CupertinoIcons.repeat;
                              }
                              return IconButton(
                                onPressed: provider.toggleRepeat,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                    minWidth: 36, minHeight: 36),
                                icon: Icon(icon,
                                    size: ScreenHelper.miniPlayerIconSize(
                                        context)),
                                color: active
                                    ? Theme.of(context).colorScheme.primary
                                    : color,
                              );
                            },
                          ),
                        if (!isRadio)
                          IconButton(
                            onPressed: hasNext ? provider.skipNext : null,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                                minWidth: 36, minHeight: 36),
                            icon: Icon(Icons.skip_next_rounded,
                                size: ScreenHelper.miniPlayerSkipIconSize(
                                    context)),
                            color: color,
                          ),
                      ],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
