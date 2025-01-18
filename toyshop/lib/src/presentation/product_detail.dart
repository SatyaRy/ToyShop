// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/components/dialog.dart';
import 'package:toyshop/src/presentation/components/handle_message.dart';
import 'package:toyshop/src/model/product/product.dart';
import 'package:toyshop/src/provider/favorite.dart';
import 'package:toyshop/src/provider/product_provider.dart';
import 'package:toyshop/src/theme/colors.dart';

class ProductDetail extends ConsumerWidget {
  final String productID;
  const ProductDetail({super.key, required this.productID});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetailProvider =
        ref.watch(getProductDetailProvider(productID));
    return productDetailProvider.when(
        data: (data) => Scaffold(
              appBar: appBar(
                  context,
                  ref,
                  FavoriteModel(
                      productID: productID,
                      productImage: data["productImage"],
                      productName: data["productName"],
                      productPrice: data["productPrice"])),
              backgroundColor: const Color(0xffEEEEEE),
              body: Column(
                children: [
                  imageDetail(data["productImage"]),
                  const SizedBox(
                    height: 10,
                  ),
                  detail(
                    context,
                    data["productName"],
                    data["productPrice"],
                    data["productDetail"],
                    data["productRate"],
                  ),
                ],
              ),
            ),
        error: (error, stacktrace) => Text("$error"),
        loading: () => buildLoadingWidget());
  }

  Widget detail(BuildContext context, String productName, double productPrice,
      String productDetail, dynamic productRate) {
    return Expanded(
        child: Container(
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 40, top: 25),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          Text("\$ ${productPrice.toString()}",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    productRate.toString(),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 20),
            child: Text(
              productDetail,
              style: const TextStyle(
                fontSize: 17,
                fontFamily: "sfpro",
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10)),
                  child:  Center(
                    child: Text("ដាក់ចូលកន្ត្រក",
                        style: GoogleFonts.hanuman(color: Colors.white, fontSize: 17)),
                  ),
                ),
              ))
        ],
      ),
    ));
  }

  Widget imageDetail(String productImage) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          CachedNetworkSVGImage(
            productImage,
            width: 300,
          )
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context, WidgetRef ref, FavoriteModel model) {
    return AppBar(
      backgroundColor: const Color(0xffEEEEEE),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Container(
          width: 100,
          height: 100,
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
                  Navigator.of(context).pushNamed(
                      "/showcase");
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
        ),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Row(
              children: [
                DetailHead(
                  detailIcon: const Icon(Icons.share),
                  isClick: () {},
                ),
                const SizedBox(
                  width: 20,
                ),
                DetailHead(
                    detailIcon: const Icon(Icons.favorite_outline),
                    isClick: () {
                      ref.read(addToFavoriteProvider((
                        productID: productID,
                        model: model,
                      )));
                      ref.invalidate(addToFavoriteProvider);
                      showDialog(
                          context: context,
                          builder: (context) => DialogBox(
                              dialogText: "ដាក់ទំនិញដែលអ្នកពេញចិត្ត",
                              dialogColor: AppColors.add));
                    })
              ],
            ))
      ],
    );
  }
}

// ignore: must_be_immutable
class DetailHead extends StatelessWidget {
  Icon detailIcon;
  void Function()? isClick;
  DetailHead({
    super.key,
    required this.detailIcon,
    required this.isClick,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isClick,
        child: Container(
          height: 45,
          width: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 0.5,
                  offset: Offset(1, 0.5),
                )
              ]),
          child: detailIcon,
        ));
  }
}
