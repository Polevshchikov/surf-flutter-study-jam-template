import 'package:flutter/material.dart';

class SideArrowRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final startMargin = width / 14;

    final s1 = height * 0.3;
    final s2 = height * 0.7;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, width - startMargin, height),
          const Radius.circular(5),
        ),
      )
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
