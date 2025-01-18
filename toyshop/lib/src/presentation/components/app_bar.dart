// ignore_for_file: must_be_immutable

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/provider/transaction.dart';

class MyAppBar extends ConsumerWidget {
  String routing;
  String pageDetail;
  void Function()? onTap;
  MyAppBar({
    super.key,
    required this.onTap,
    required this.routing,
    required this.pageDetail,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(getQuantityProvider);
    return SliverAppBar(
      backgroundColor: const Color(0xffEEEEEE),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
            width: 150,
            height: 150,
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
            child: GestureDetector(
              onTap: onTap,
              child: const Center(child: Icon(Icons.chevron_left,size: 30,)),
            ))),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      "/cart",);
                },
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10, end: -20),
                  badgeContent: Center(
                    child: Text("$quantity",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
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

AppBar mainAppBar(WidgetRef ref, BuildContext context) {
  final quantity = ref.watch(getQuantityProvider);
  return AppBar(
    backgroundColor: const Color(0xffEEEEEE),
    leading: Builder(
        builder: (context) => Container(
              margin: const EdgeInsets.only(left: 20),
              child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.sort,
                    size: 40,
                    color: Colors.black,
                  )),
            )),
    iconTheme: const IconThemeData(color: Colors.white, size: 30),
    actions: [
      Padding(
          padding: const EdgeInsets.only(right: 30),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                    "/cart");
              },
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -20),
                badgeContent: Center(
                  child: Text("$quantity",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                ),
                child: const Icon(
                  color: Colors.black,
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
              )))
    ],
  );
}

AppBar authAppBar(BuildContext context,String appBarType,onTap) {
  return AppBar(
    backgroundColor: const Color(0xffEEEEEE),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(appBarType,
            style:
                GoogleFonts.hanuman(fontSize: 20, fontWeight: FontWeight.bold)),
      )
    ],
    leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
            width: 150,
            height: 150,
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
            child: GestureDetector(
              onTap: onTap,
              child: const Center(child: Icon(Icons.close)),
            ))),
  );
}
