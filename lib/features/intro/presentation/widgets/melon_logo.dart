import 'dart:math';

import 'package:flutter/material.dart';

class MelonLogo extends StatefulWidget {
  const MelonLogo({super.key});

  @override
  State<MelonLogo> createState() => _MelonLogoState();
}

class _MelonLogoState extends State<MelonLogo> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return CustomPaint(
      size: Size.square(min(200.0, screenSize.width)),
      painter: _MelonPainter(
        animation: _animationController,
      ),
      willChange: true,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _MelonPainter extends CustomPainter {
  final Animation<double> animation;
  _MelonPainter({
    required this.animation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero) - const Offset(5.0, 0.0);

    final w = size.width;
    final h = size.height;

    Path melonOuterPath = Path();
    Path melonInnerPath = Path();
    Path melonCenterPath = Path();

    final baseRadius = min(w, h) / 2;

    void drawMelon(Path path, [double radiusOffset = 0.0]) {
      path.arcTo(
        Rect.fromCircle(
          center: center,
          radius: baseRadius - radiusOffset,
        ),
        -pi * 0.125,
        pi,
        // pi * 1.9999999,
        true,
      );
    }

    drawMelon(melonOuterPath);
    drawMelon(melonInnerPath, 20);
    drawMelon(melonCenterPath, 28);

    Paint outerPaint = Paint();
    const orang = Color.fromARGB(255, 255, 152, 50);
    outerPaint.shader = SweepGradient(
      colors: const [orang, Color(0xFFFF6969), orang],
      transform: GradientRotation(animation.value * pi * 2),
    ).createShader(
      Rect.fromCircle(center: center, radius: baseRadius),
    );

    // outerPaint.shader = ui.Gradient.sweep(
    //   center,
    //   [const Color(0xFFFFB932), const Color(0xFFFF6969), const Color(0xFFFFB932)],
    //   [0.0, 0.5, 1.0],
    //   TileMode.clamp,
    //   0,
    //   pi * 2,
    //   Matrix4.rotationX(radians)
    // );

    Paint innerPaint = Paint();
    innerPaint.style = PaintingStyle.fill;
    innerPaint.color = const Color(0xFFFFE7E7);

    Paint centerPaint = Paint();
    centerPaint.style = PaintingStyle.fill;
    centerPaint.color = const Color(0xFFFFA05C);

    canvas.drawPath(
      melonOuterPath,
      outerPaint,
    );

    canvas.drawPath(
      melonInnerPath,
      innerPaint,
    );

    canvas.drawPath(
      melonCenterPath,
      centerPaint,
    );
  }

  @override
  bool shouldRepaint(_MelonPainter oldDelegate) => oldDelegate.animation.value != animation.value;

  @override
  bool shouldRebuildSemantics(_MelonPainter oldDelegate) => oldDelegate.animation.value != animation.value;
}
