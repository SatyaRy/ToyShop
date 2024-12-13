import 'package:flutter/material.dart';
import 'package:toyshop/components/image.dart';
import 'package:toyshop/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xff074799),
        body: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const ImageSection(image: "lib/assets/icons/bear.svg"),
                const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text("Customize your soft toy with 3 clicks",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white))),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context)=>HomePage()
                        ));
                  },
                  child: Container(
                    width: screenWidth * 0.65,
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color(0xff37AFE1),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text("Shop Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                )
              ],
            )));
  }
}
