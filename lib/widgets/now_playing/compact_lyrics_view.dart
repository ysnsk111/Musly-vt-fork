import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/lyric_line.dart';

class CompactLyricsView extends StatelessWidget {
  final List<LyricLine> lyrics;
  final Duration position;
  final Color accentColor;
  final ValueChanged<Duration> onSeek;
  final VoidCallback onExpandLyrics;

  const CompactLyricsView({
    super.key,
    required this.lyrics,
    required this.position,
    required this.accentColor,
    required this.onSeek,
    required this.onExpandLyrics,
  });

  @override
  Widget build(BuildContext context) {
    if (lyrics.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.08),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.music_note_rounded,
              size: 32,
              color: Colors.white.withValues(alpha: 0.35),
            ),
            const SizedBox(height: 8),
            Text(
              "暂无歌词或伴奏纯音乐",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    int activeIndex = -1;
    for (int i = 0; i < lyrics.length; i++) {
      final line = lyrics[i];
      final next = (i + 1 < lyrics.length) ? lyrics[i + 1] : null;
      if (position >= line.startTime &&
          (next == null || position < next.startTime)) {
        activeIndex = i;
        break;
      }
    }

    // Determine window of 3 lines: previous, current, next
    final prevLine = (activeIndex > 0) ? lyrics[activeIndex - 1] : null;
    final currLine = (activeIndex >= 0) ? lyrics[activeIndex] : lyrics.first;
    final nextLine = (activeIndex + 1 < lyrics.length) ? lyrics[activeIndex + 1] : null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accentColor,
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withValues(alpha: 0.8),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "同步歌词",
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.6),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  HapticFeedback.lightImpact();
                  onExpandLyrics();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Row(
                    children: [
                      Text(
                        "全屏",
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                          color: accentColor,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 14,
                        color: accentColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Previous line
          if (prevLine != null)
            _buildLyricRow(
              line: prevLine,
              isActive: false,
              isSecondary: true,
              accentColor: accentColor,
            )
          else
            const SizedBox(height: 22),

          const SizedBox(height: 8),

          // Current active line (highlighted & scaled)
          _buildLyricRow(
            line: currLine,
            isActive: true,
            isSecondary: false,
            accentColor: accentColor,
          ),

          const SizedBox(height: 8),

          // Next line
          if (nextLine != null)
            _buildLyricRow(
              line: nextLine,
              isActive: false,
              isSecondary: true,
              accentColor: accentColor,
            )
          else
            const SizedBox(height: 22),
        ],
      ),
    );
  }

  Widget _buildLyricRow({
    required LyricLine line,
    required bool isActive,
    required bool isSecondary,
    required Color accentColor,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        HapticFeedback.selectionClick();
        onSeek(line.startTime);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 12.0 : 8.0,
          vertical: isActive ? 6.0 : 3.0,
        ),
        decoration: BoxDecoration(
          color: isActive
              ? accentColor.withValues(alpha: 0.16)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isActive
              ? Border.all(
                  color: accentColor.withValues(alpha: 0.35),
                  width: 1,
                )
              : null,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          style: TextStyle(
            fontSize: isActive ? 17.0 : 13.5,
            fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
            color: isActive
                ? Colors.white
                : Colors.white.withValues(alpha: 0.5),
            letterSpacing: isActive ? -0.2 : 0.0,
            height: 1.25,
            shadows: isActive
                ? [
                    Shadow(
                      color: accentColor.withValues(alpha: 0.6),
                      blurRadius: 10,
                    ),
                  ]
                : null,
          ),
          child: Text(
            line.text.trim().isEmpty ? "..." : line.text.trim(),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
