// ignore_for_file: must_be_immutable

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  String routing;
  String pageDetail;
  MyAppBar({
    super.key,
    required this.routing,
    required this.pageDetail,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xffEEEEEE),
      title: Text(
        pageDetail,
        style: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.only(left: 5),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 0.5,
                  offset: Offset(1, 0.5),
                )
              ]),
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/home", (route) => false);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
        ),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/cart");
                  Navigator.pop(context);
                },
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: -10),
                  badgeContent: const Center(
                    child: Text("1",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  ),
                )))
      ],
    );
  }
}
