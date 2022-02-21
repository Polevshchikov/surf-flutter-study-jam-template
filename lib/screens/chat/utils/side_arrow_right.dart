import 'package:flutter/material.dart';

class SideArrowRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    final double startMargin = width / 14;

    final double s1 = height * 0.3;
    final double s2 = height * 0.7;
    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, width - startMargin, height),
          const Radius.circular(5)))
      ..lineTo(width - startMargin, s1)
      ..lineTo(width, size.height / 2)
      ..lineTo(width - startMargin, s2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
