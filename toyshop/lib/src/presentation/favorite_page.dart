import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/components/dialog.dart';
import 'package:toyshop/src/presentation/components/handle_message.dart';
import 'package:toyshop/src/provider/favorite.dart';
import 'package:toyshop/src/provider/transaction.dart';
import 'package:toyshop/src/theme/colors.dart';
import "package:badges/badges.dart" as badges;

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProvider = ref.watch(getFavoriteProvider);
    return Scaffold(
      appBar: authAppBar(context, ref),
      backgroundColor: const Color(0xffEEEEEE),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        children: [
          const SizedBox(
            height: 40,
          ),
          Text("ទំនិញដែលអ្នកចូលចិត្ត",
              style: GoogleFonts.hanuman(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
          const SizedBox(
            height: 20,
          ),
          favoriteProvider.when(
              data: (value) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) {
                      final data = value[index];
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 15,
                                  children: [
                                    CachedNetworkSVGImage(data.productImage),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(data.productName),
                                        Text("\$ ${data.productPrice}",
                                            style: const TextStyle(
                                                color: Color(0xff074799)))
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => DialogBox(
                                              dialogText:
                                                  "ដកទំនិញដែលអ្នកពេញចិត្ត",
                                              dialogColor: AppColors.remove));
                                      ref.read(deleteFavoriteProvider(
                                          data.productID));
                                      ref.invalidate(deleteFavoriteProvider);
                                    },
                                    child: const Icon(Icons.favorite,
                                        size: 30, color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
              error: (error, stacktrace) => Text("$error"),
              loading: () => buildLoadingWidget())
        ],
      ),
    );
  }

  AppBar authAppBar(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(getQuantityProvider);
    return AppBar(
      backgroundColor: const Color(0xffEEEEEE),
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
                    color: Colors.black,
                    Icons.shopping_cart_outlined,
                    size: 30,
                  ),
                )))
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
                onTap: () => Navigator.pop(context),
                child: const Center(child: Icon(Icons.close)),
              ))),
    );
  }
}
