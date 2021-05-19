import 'package:flutter/material.dart';

class HeaderClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0, size.height - 100)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 100)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
