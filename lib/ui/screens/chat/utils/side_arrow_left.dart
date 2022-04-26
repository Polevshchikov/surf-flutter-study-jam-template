import 'package:flutter/material.dart';

class SideArrowLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    final height = size.height;
    final width = size.width;
    final startMargin = width / 14;
    final s1 = height * 0.3;
    final s2 = height * 0.7;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(startMargin, 0, width - startMargin, height),
          const Radius.circular(5),
        ),
      )
      ..lineTo(startMargin, s1)
      ..lineTo(0, size.height / 2)
      ..lineTo(startMargin, s2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
