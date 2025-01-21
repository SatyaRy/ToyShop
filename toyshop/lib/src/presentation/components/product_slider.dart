import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  final String data;
  const ProductSlider({
    required this.data,
    super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff0a33f9),
              Color(0xff091970),
            ]),
      ),
      child: Stack(
        children: [
          const Positioned(
              top: 30,
              left: 10,
              child: Text(
                "30% OFF",
                style: TextStyle(
                    fontFamily: "sfpro",
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
              top: 100,
              left: 160,
              child: CachedNetworkSVGImage(
                  width: 120,
                  height: 120,
                  "https://res.cloudinary.com/dnydodget/image/upload/v1737296399/Untitled_design_9_xfvnaz.svg")),
          Positioned(
              top: 0,
              left: 150,
              child: CachedNetworkSVGImage(width: 150, height: 150, data)),
          Positioned(
              top: 120,
              left: 10,
              child: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.onSecondary,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3, 3),
                          spreadRadius: 1)
                    ]),
                child: const Center(
                  child: Text(
                    "Shop",
                    style: TextStyle(
                      fontFamily: "sfpro",
                      color: Color(0xff212121),
                      fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
