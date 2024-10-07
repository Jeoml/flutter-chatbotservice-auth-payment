import 'package:flutter/material.dart';
import '../painters/dotted_painter.dart'; // Adjust the path accordingly


class DottedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedPainter(),
      child: Center(
      ),
    );
  }
}