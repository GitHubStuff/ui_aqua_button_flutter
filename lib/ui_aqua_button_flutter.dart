library ui_aqua_button_flutter;

import 'package:flutter/material.dart';

class AquaButton extends StatelessWidget {
  final MaterialColor materialColor;
  final double mainRadius;

  const AquaButton({
    super.key,
    this.materialColor = Colors.red,
    this.mainRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    double northPoleRadius = mainRadius * 0.85;

    return Container(
      width: mainRadius * 2.0,
      height: mainRadius * 2.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            materialColor,
            materialColor[900]!,
            materialColor[700]!,
            materialColor[500]!,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          // North pole
          Positioned(
            left: mainRadius - northPoleRadius,
            top: -northPoleRadius / 1.3,
            child: Container(
              width: northPoleRadius * 2.0,
              height: northPoleRadius * 2.0,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.55),
                    Colors.transparent,
                  ],
                  stops: const [0.09, 0.8],
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // South pole
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipOval(
              child: CustomPaint(
                size: Size(mainRadius * 2.0, mainRadius * 2.0),
                painter: _TrianglePainter(mainRadius: mainRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final double mainRadius;

  _TrianglePainter({required this.mainRadius});

  @override
  void paint(Canvas canvas, Size size) {
    double triangleHeight = size.height / 2.5;
    double triangleBase = size.width * 1.0;

    Path path = Path()
      ..moveTo(size.width / 2.0, size.height - triangleHeight)
      ..lineTo(0, size.height)
      ..lineTo(triangleBase, size.height)
      ..close();

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white.withOpacity(0.1),
        Colors.white.withOpacity(0.3),
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromPoints(
          Offset(0.0, size.height - triangleHeight),
          Offset(triangleBase, size.height),
        ),
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
