import 'package:flutter/material.dart';
import '../painters/dotted_painter.dart'; // Adjust the path accordingly


class DottedBackground extends StatelessWidget {
  const DottedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedPainter(),
      child: const Center(
      ),
    );
  }
}