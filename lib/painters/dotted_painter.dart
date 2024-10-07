import 'package:flutter/material.dart';

class DottedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 207, 207, 207) // Color of the dots
      ..style = PaintingStyle.fill;

    double spacing = 15.0; // Spacing between the dots
    double radius = 1.2; // Radius of the dots

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
