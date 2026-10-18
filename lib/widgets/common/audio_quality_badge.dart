import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/song.dart';

class AudioQualityBadge extends StatelessWidget {
  final Song song;
  final double fontSize;

  const AudioQualityBadge({
    super.key,
    required this.song,
    this.fontSize = 10.5,
  });

  @override
  Widget build(BuildContext context) {
    final suffix = (song.suffix ?? '').toLowerCase().trim();
    final bitRate = song.bitRate;
    final isLossless = suffix == 'flac' ||
        suffix == 'wav' ||
        suffix == 'alac' ||
        suffix == 'dsd' ||
        suffix == 'aiff';

    String label;
    IconData icon = CupertinoIcons.waveform;
    Color accentColor = const Color(0xFF10B981); // Emerald green for high quality

    if (song.hasDolbyAtmos == true) {
      label = 'DOLBY ATMOS';
      icon = CupertinoIcons.speaker_2_fill;
      accentColor = const Color(0xFF6366F1);
    } else if (isLossless) {
      if (bitRate != null && bitRate > 1500) {
        label = 'HI-RES LOSSLESS • ${suffix.toUpperCase()}';
        accentColor = const Color(0xFFEAB308); // Gold for Hi-Res
      } else {
        label = 'LOSSLESS • ${suffix.toUpperCase()}';
      }
    } else if (bitRate != null && bitRate >= 320) {
      label = '${suffix.toUpperCase()} • 320 KBPS';
      accentColor = const Color(0xFF38BDF8);
    } else if (bitRate != null && bitRate > 0) {
      label = '${suffix.toUpperCase()} • $bitRate KBPS';
      accentColor = const Color(0xFF94A3B8);
    } else if (suffix.isNotEmpty) {
      label = suffix.toUpperCase();
      accentColor = const Color(0xFF94A3B8);
    } else {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.4),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: fontSize + 1,
            color: accentColor,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
