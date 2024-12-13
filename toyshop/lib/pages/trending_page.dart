import 'package:flutter/material.dart';
import 'package:toyshop/components/image.dart';
import 'package:toyshop/components/trending.dart';
import 'package:toyshop/models/trending_model.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      padding: EdgeInsets.only(left: 20, right: 20),
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
            height: 200,
            width: screenWidth,
            decoration: BoxDecoration(
                color: const Color(0xffEB5B00),
                borderRadius: BorderRadius.circular(15)),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: ImageSection(image: "lib/assets/icons/ninja.svg"),
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
            width: 100,
            height: 60,
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search For Toys",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 10),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        print("Searching ...");
                      },
                      child: const Icon(Icons.search),
                    )),
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 100,
          height: 50,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Most Popular",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Text("Show all", style: TextStyle(color: Color(0xff074799)))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
