import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.image,
  });
  final String image;
 
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SvgPicture.asset(
      image,
      width:screenWidth ,
      fit: BoxFit.contain,
    );
  }
}
