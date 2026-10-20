import 'dart:math' as math;
import 'package:flutter/material.dart';

class VinylRecordPlayer extends StatefulWidget {
  final ImageProvider image;
  final bool isPlaying;
  final String heroTag;
  final VoidCallback? onSwipeLeft;
  final VoidCallback? onSwipeRight;
  final double dragOffset;

  const VinylRecordPlayer({
    super.key,
    required this.image,
    required this.isPlaying,
    required this.heroTag,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.dragOffset = 0.0,
  });

  @override
  State<VinylRecordPlayer> createState() => _VinylRecordPlayerState();
}

class _VinylRecordPlayerState extends State<VinylRecordPlayer>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _armController;
  late Animation<double> _armAnimation;

  @override
  void initState() {
    super.initState();
    // Vinyl continuous rotation controller (20 seconds per revolution, ~33 1/3 RPM feel)
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    );

    // Mechanical tonearm swing controller
    _armController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // Arm moves from 0 degrees (cradle rest) to ~26 degrees (playing on record)
    _armAnimation = CurvedAnimation(
      parent: _armController,
      curve: Curves.easeInOutCubic,
    );

    if (widget.isPlaying) {
      _rotationController.repeat();
      _armController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant VinylRecordPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying != oldWidget.isPlaying) {
      if (widget.isPlaying) {
        _rotationController.repeat();
        _armController.forward();
      } else {
        _rotationController.stop();
        _armController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _armController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = math.min(constraints.maxWidth, constraints.maxHeight);
        final discSize = size * 0.88;
        final armSize = size * 0.46;

        final double visualAngle = widget.dragOffset * 0.0015;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Center Turntable & Vinyl Disc
            Transform.translate(
              offset: Offset(widget.dragOffset * 0.8, 0),
              child: Transform.rotate(
                angle: visualAngle,
                child: SizedBox(
                  width: discSize,
                  height: discSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Turntable Platter Outer Shadow
                      Container(
                        width: discSize,
                        height: discSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.55),
                              blurRadius: 28,
                              spreadRadius: 4,
                              offset: const Offset(0, 14),
                            ),
                          ],
                        ),
                      ),

                      // Rotating Vinyl Disc (Grooves + Center Cover Art)
                      AnimatedBuilder(
                        animation: _rotationController,
                        builder: (context, child) {
                          final currentAngle =
                              _rotationController.value * 2 * math.pi;
                          return Transform.rotate(
                            angle: currentAngle,
                            child: child,
                          );
                        },
                        child: CustomPaint(
                          size: Size(discSize, discSize),
                          painter: _VinylDiscPainter(),
                          child: Center(
                            child: Hero(
                              tag: widget.heroTag,
                              child: ClipOval(
                                child: Container(
                                  width: discSize * 0.44,
                                  height: discSize * 0.44,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          Colors.white.withValues(alpha: 0.2),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Image(
                                    image: widget.image,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      color: Colors.grey[900],
                                      child: const Icon(
                                        Icons.album_rounded,
                                        size: 48,
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Center Spindle Hole & Metallic Ring
                      Container(
                        width: discSize * 0.08,
                        height: discSize * 0.08,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFD4AF37),
                          gradient: const RadialGradient(
                            colors: [
                              Color(0xFFFFFFFF),
                              Color(0xFFCCCCCC),
                              Color(0xFF333333),
                            ],
                            stops: [0.0, 0.4, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.6),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: discSize * 0.024,
                            height: discSize * 0.024,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF0F0F12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Mechanical Tonearm at Top-Right
            Positioned(
              top: 0,
              right: constraints.maxWidth * 0.06,
              child: AnimatedBuilder(
                animation: _armAnimation,
                builder: (context, child) {
                  // Tonearm swings by about 25 degrees when playing
                  final armAngle = _armAnimation.value * (25.0 * math.pi / 180.0);
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateZ(armAngle),
                    alignment: Alignment.topRight,
                    child: child,
                  );
                },
                child: _TonearmWidget(height: armSize),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _VinylDiscPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // 1. Vinyl Base Platter
    final basePaint = Paint()
      ..shader = RadialGradient(
        colors: const [
          Color(0xFF1E1E22),
          Color(0xFF141416),
          Color(0xFF0B0B0D),
          Color(0xFF000000),
        ],
        stops: const [0.0, 0.45, 0.85, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, basePaint);

    // 2. Realistic concentric grooves (sound tracks)
    final groovePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.75
      ..color = Colors.white.withValues(alpha: 0.045);

    final trackStart = radius * 0.46;
    final trackEnd = radius * 0.94;
    final step = (trackEnd - trackStart) / 18;

    for (double r = trackStart; r < trackEnd; r += step) {
      canvas.drawCircle(center, r, groovePaint);
    }

    // Outer edge rim
    final rimPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.white.withValues(alpha: 0.12);
    canvas.drawCircle(center, radius - 1, rimPaint);

    // 3. Vinyl Sheen / Specular Light Reflection (Two conical glare sectors)
    final glarePaint = Paint()
      ..shader = SweepGradient(
        colors: [
          Colors.white.withValues(alpha: 0.0),
          Colors.white.withValues(alpha: 0.09),
          Colors.white.withValues(alpha: 0.0),
          Colors.white.withValues(alpha: 0.08),
          Colors.white.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius * 0.95, glarePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TonearmWidget extends StatelessWidget {
  final double height;

  const _TonearmWidget({required this.height});

  @override
  Widget build(BuildContext context) {
    final width = height * 0.38;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Base Pivot Pivot
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [
                    Color(0xFFE5E5EA),
                    Color(0xFF8E8E93),
                    Color(0xFF3A3A3C),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1C1C1E),
                  ),
                ),
              ),
            ),
          ),

          // Metallic Tonearm Shaft
          Positioned(
            top: 24,
            right: 17,
            child: Container(
              width: 4,
              height: height * 0.72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFD1D1D6),
                    Color(0xFFFFFFFF),
                    Color(0xFF8E8E93),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.35),
                    blurRadius: 6,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
            ),
          ),

          // Tonearm Headshell & Stylus Needle Cartridge
          Positioned(
            bottom: 4,
            right: 8,
            child: Transform.rotate(
              angle: -0.32,
              child: Container(
                width: 22,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFF3B30),
                      Color(0xFFB00020),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 3,
                    height: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
