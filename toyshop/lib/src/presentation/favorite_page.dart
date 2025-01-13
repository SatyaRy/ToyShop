import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/components/dialog.dart';
import 'package:toyshop/src/components/handle_message.dart';
import 'package:toyshop/src/provider/favorite.dart';
import 'package:toyshop/src/theme/colors.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProvider = ref.watch(getFavoriteProvider);
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text("Favorite",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            dialogText: "Removed from favorite list",
                                            dialogColor: AppColors.remove));
                                    ref.read(
                                        deleteFavoriteProvider(data.productID));
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
    );
  }
}
