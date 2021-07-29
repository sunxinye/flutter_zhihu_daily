import 'dart:ui';
import 'package:flutter/material.dart';

class BgClipper extends CustomClipper<Path> {
  final double topPartHeight;
  final Radius centerCornerRadius;

  const BgClipper({this.topPartHeight, this.centerCornerRadius}) : super();
  @override
  Path getClip(Size size) {
    Path topPath = Path();
    topPath.moveTo(0, 0);
    topPath.lineTo(0, topPartHeight - centerCornerRadius.y);
    topPath.arcTo(
        Rect.fromCircle(
            center: Offset(
                centerCornerRadius.x, topPartHeight - centerCornerRadius.y),
            radius: centerCornerRadius.x),
        3.14,
        -1.57,
        false);
    topPath.lineTo(size.width - centerCornerRadius.x, topPartHeight);
    topPath.arcTo(
        Rect.fromCircle(
            center: Offset(size.width - centerCornerRadius.x,
                topPartHeight + centerCornerRadius.y),
            radius: centerCornerRadius.x),
        -1.57,
        1.57,
        false);
    topPath.lineTo(size.width, 0);
    topPath.close();
    return topPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
