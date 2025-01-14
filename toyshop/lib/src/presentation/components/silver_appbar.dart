// ignore_for_file: must_be_immutable

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/provider/transaction.dart';

class MyAppBar extends ConsumerWidget {
  String routing;
  String pageDetail;
  MyAppBar({
    super.key,
    required this.routing,
    required this.pageDetail,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(getQuantityProvider);
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
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
                onTap: () {
                Navigator.of(context)
                .pushNamedAndRemoveUntil("/cart", (Route<dynamic> route)=>false);
    
                },
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: -20),
                  badgeContent:  Center(
                    child: Text("$quantity",
                        style: const TextStyle(color: Colors.white, fontSize: 15)),
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
