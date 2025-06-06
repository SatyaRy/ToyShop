import 'package:flutter/widgets.dart';

class CustomizePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, 0);
    path.quadraticBezierTo(
        0, size.height * 0.4500000, 0, size.height * 0.6000000);
    path.cubicTo(
        size.width * 0.3000000,
        size.height * 0.9000000,
        size.width * 0.7000000,
        size.height * 0.3000000,
        size.width,
        size.height * 0.6000000);
    path.quadraticBezierTo(size.width, size.height * 0.4500000, size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ClipPathCustom extends StatelessWidget {
  const ClipPathCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomizePath(),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xff0a33f9),
              Color(0xff091970),
            ])),
        height: 250,
      ),
    );;
  }
}