import 'package:flutter/material.dart';

class BottomAppBarPainter extends CustomPainter {
  final Radius gapRadius;
  final Radius cornerRadius;
  final Color backgroundColor;

  const BottomAppBarPainter(
      {this.gapRadius, this.cornerRadius, this.backgroundColor: Colors.white})
      : super();
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..color = backgroundColor;
    final Paint shadowPaint = new Paint()
      ..color = Colors.black26
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, 8);
    double roundCornerLength = 8;

    Path path = Path();
    path.moveTo(0, 0);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(cornerRadius.x, cornerRadius.y),
            radius: cornerRadius.x),
        3.14,
        1.57,
        false);
    path.lineTo(size.width / 2 - gapRadius.x - roundCornerLength, 0);
    path.quadraticBezierTo(size.width / 2 - gapRadius.x, 0, size.width / 2 - gapRadius.x, roundCornerLength);
    path.arcToPoint(
      Offset(size.width / 2 + gapRadius.x, roundCornerLength),
      radius: Radius.circular(gapRadius.x + 1),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width / 2 + gapRadius.x, 0, size.width / 2 + gapRadius.x + roundCornerLength, 0);
    path.lineTo(size.width - cornerRadius.x, 0);

    path.arcTo(
        Rect.fromCircle(
            center: Offset(size.width - cornerRadius.x, cornerRadius.y),
            radius: cornerRadius.x),
        -1.57,
        1.57,
        false);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, shadowPaint);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class GapPainter extends CustomPainter {
  final Radius gapRadius;
  final Radius cornerRadius;

  const GapPainter({this.gapRadius, this.cornerRadius}) : super();
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.orangeAccent, Colors.yellow],
      tileMode: TileMode.clamp,);

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);
    // final Paint paint = new Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 3
    //   ..color = Colors.black;
    final Paint shadowPaint = new Paint()
      ..color = Colors.black38
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, 10);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - gapRadius.y);
    path.arcTo(Rect.fromCircle(
        center: Offset(size.width - gapRadius.x, size.height - gapRadius.y),
        radius: gapRadius.x), 0, -4.71, false);
    path.lineTo(size.width - gapRadius.x, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, shadowPaint);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

