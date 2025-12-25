import 'package:flutter/material.dart';

Widget pokerTable() {
  return Center(
    child: CustomPaint(
      size: const Size(360, 220),
      painter: PokerTablePainter(),
    ),
  );
}

class PokerTablePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final tablePaint = Paint()
      ..color = const Color(0xFF0A5C2E)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xFF7A0A0A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawOval(rect, tablePaint);
    canvas.drawOval(rect.deflate(6), borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
