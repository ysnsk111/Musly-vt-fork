import 'dart:ui';
import 'package:flutter/material.dart';
import '../../models/lyric_line.dart';
import '../../services/player_ui_settings_service.dart';

enum LyricLineState { past, current, future }

class LyricsLineWidget extends StatelessWidget {
  final LyricLine line;
  final LyricLineState state;
  final Duration currentTime;
  final VoidCallback onTap;
  final int distance;

  const LyricsLineWidget({
    super.key,
    required this.line,
    required this.state,
    required this.currentTime,
    required this.onTap,
    this.distance = 0,
  });

  @override
  Widget build(BuildContext context) {
    final uiSettings = PlayerUiSettingsService();
    final isCentered = uiSettings.getLyricsAlignment() == 'center';
    final blurUnfocused = uiSettings.getLyricsBlurUnfocused();
    final glowEffect = uiSettings.getLyricsGlowEffect();
    final textAlign = isCentered ? TextAlign.center : TextAlign.left;
    final alignment = isCentered ? Alignment.center : Alignment.centerLeft;
    final isCurrent = state == LyricLineState.current;

    final targetScale = isCurrent ? 1.06 : 1.0;
    final targetOpacity = isCurrent
        ? 1.0
        : (state == LyricLineState.past ? 0.38 : 0.30);
    final targetPadding = EdgeInsets.symmetric(
      vertical: isCurrent ? 14.0 : 9.0,
      horizontal: 24.0,
    );

    Widget content = line.hasWords && isCurrent
        ? _buildWordByWord(textAlign, glowEffect)
        : _buildLineLevel(textAlign, glowEffect, isCurrent);

    if (blurUnfocused && state == LyricLineState.future) {
      final double sigma = (distance * 0.7).clamp(0.0, 2.5);
      if (sigma > 0) {
        content = ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: content,
        );
      }
    }

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
        padding: targetPadding,
        child: AnimatedScale(
          scale: targetScale,
          duration: const Duration(milliseconds: 320),
          curve: Curves.easeOutCubic,
          alignment: alignment,
          child: AnimatedOpacity(
            opacity: targetOpacity,
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOut,
            child: SizedBox(
              width: double.infinity,
              child: content,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineLevel(TextAlign textAlign, bool glowEffect, bool isCurrent) {
    return Text(
      line.text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: isCurrent ? 25 : 22,
        fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
        color: Colors.white,
        height: 1.42,
        shadows: isCurrent && glowEffect
            ? [
                Shadow(
                  color: Colors.white.withValues(alpha: 0.65),
                  blurRadius: 18.0,
                ),
                Shadow(
                  color: Colors.white.withValues(alpha: 0.35),
                  blurRadius: 32.0,
                ),
              ]
            : null,
      ),
    );
  }

  Widget _buildWordByWord(TextAlign textAlign, bool glowEffect) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: line.words!.map((word) {
          double progress = 0.0;
          if (currentTime >= word.startTime && currentTime <= word.endTime) {
            final duration =
                word.endTime.inMilliseconds - word.startTime.inMilliseconds;
            final elapsed =
                currentTime.inMilliseconds - word.startTime.inMilliseconds;
            progress = duration > 0 ? (elapsed / duration).clamp(0.0, 1.0) : 1.0;
          } else if (currentTime > word.endTime) {
            progress = 1.0;
          }

          return WidgetSpan(
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withValues(alpha: 0.4),
                  ],
                  stops: [progress, progress],
                ).createShader(bounds);
              },
              child: Text(
                '${word.text} ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.42,
                  shadows: glowEffect
                      ? [
                          Shadow(
                            color: Colors.white.withValues(alpha: 0.6),
                            blurRadius: 18.0,
                          ),
                        ]
                      : null,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
