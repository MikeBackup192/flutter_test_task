import 'dart:math';
import 'package:flutter/material.dart';

class PercentageCirclePainter extends CustomPainter {
  final double percentage;

  PercentageCirclePainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBackground = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255) 
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Paint paintProgress = Paint()
      ..color = const Color.fromARGB(255, 53, 186, 248) 
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paintBackground);

    
    double progressAngle = 2 * pi * percentage;
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
        -pi / 2, progressAngle, false, paintProgress);

    
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: (percentage * 100).toStringAsFixed(0), 
        style: TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontFamily: 'SFProDisplay',
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(size.width / 2 - textPainter.width / 2, size.height / 2 - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; 
  }
}