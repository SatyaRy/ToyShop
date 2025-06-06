import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/provider/initialize.dart';

class IntroPage extends ConsumerWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        
        body: Container(
          decoration: const BoxDecoration(
          gradient:LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0a33f9),
            Color(0xff091970),
          ]
        ),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                CachedNetworkSVGImage(
                    width: MediaQuery.of(context).size.width,
                    "https://res.cloudinary.com/dnydodget/image/upload/v1735102422/toyshop_scok5w.svg"),
                const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text("Customize your soft toy with 3 clicks",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily:"sfpro",
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white))),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(initializeAppProvider);
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/signin", (route) => false);
                  },
                  child: Container(
                    width: screenWidth * 0.65,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            offset: Offset(4, 6)
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text("Shop Now",
                          style: TextStyle(
                            fontFamily: "sfpro",
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                )
              ],
            )),
        ));
  }
}
