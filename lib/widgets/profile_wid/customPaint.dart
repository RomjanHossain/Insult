import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xFF495464)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(size.width * 0.23, 0, size.width * 0.31, 0);
    path_0.cubicTo(size.width * 0.43, size.height * 0.15, size.width * 0.57,
        size.height * 0.15, size.width * 0.69, 0);
    path_0.quadraticBezierTo(size.width * 0.77, 0, size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.50, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
