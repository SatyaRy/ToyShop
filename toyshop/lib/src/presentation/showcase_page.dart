import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toyshop/src/components/dialog.dart';
import 'package:toyshop/src/components/filter_box.dart';
import 'package:toyshop/src/components/silver_appbar.dart';
import 'package:toyshop/src/model/product/product.dart';
import 'package:toyshop/src/provider/cart/cart.dart';
import 'package:toyshop/src/provider/product/product_provider.dart';
import 'package:toyshop/src/theme/colors.dart';

class ShowcaseProductPage extends ConsumerWidget {
  const ShowcaseProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meidaQuery = MediaQuery.of(context).size;
    final productType = ref.watch(filterProvider);
    final trendingList = ref.watch(getTrendingToyProvider(productType));
    Color getButtonColor(String changeProductType) {
      return productType == changeProductType ? const Color(0xff074799) : Colors.white;
    }

    return Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  MyAppBar(
                    pageDetail: "",
                    routing: "/home",
                  )
                ],
            body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Text("Find your favorite toy below",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Container(
                      width: meidaQuery.width,
                      height: 80,
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          FilterBox(
                              currentBoxColor: getButtonColor("trendingToy"),
                              filterText: "Trending",
                              filterColor: productType == "trendingToy"? Colors.white : Colors.black,
                              onTap: () {
                                ref
                                    .read(filterProvider.notifier)
                                    .changeFilter("trendingToy");
                              },
                              filterWidth: 80),
                          FilterBox(
                              currentBoxColor: getButtonColor("bestSelling"),
                              filterText: "Best Selling",
                              filterColor: productType == "bestSelling"? Colors.white : Colors.black,
                              onTap: () {
                                ref
                                    .read(filterProvider.notifier)
                                    .changeFilter("bestSelling");
                              },
                              filterWidth: 90),
                          FilterBox(
                              currentBoxColor: getButtonColor("newest"),
                              filterText: "Newest",
                              filterColor: productType == "newest"? Colors.white : Colors.black,
                              onTap: (){
                                 ref
                                    .read(filterProvider.notifier)
                                    .changeFilter("newest");
                              },
                              filterWidth: 90),
                          FilterBox(
                              currentBoxColor: getButtonColor("oldest"),
                              filterText: "Oldest",
                              filterColor: productType == "oldest"? Colors.white : Colors.black,
                              onTap: (){
                                ref
                                    .read(filterProvider.notifier)
                                    .changeFilter("oldest");
                              },
                              filterWidth: 90),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    trendingList.when(
                        data: (value) {
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              final data = value[index];
                              final CartModel cartModel = CartModel(
                                  productID: data.productID,
                                  productImage: data.productImage,
                                  productName: data.productName,
                                  productPrice: data.productPrice,
                                  productQuantity: data.productQuantity,
                                  timeStamp: "now");
                              return ShowcaseList(
                                image: data.productImage,
                                price: data.productPrice,
                                productName: data.productName,
                                onTap: () {
                                  ref.read(addToCartProvider(cartModel,
                                      data.productID, data.productQuantity));
                                  showDialog(
                                      context: context,
                                      builder: (context) => DialogBox(
                                          dialogText: "Item added to cart",
                                          dialogColor: AppColors.add));
                                },
                              );
                            },
                          );
                        },
                        error: (error, stacktrace) => Text("$error"),
                        loading: () => const CircularProgressIndicator())
                  ],
                ))));
  }
}

// ignore: must_be_immutable
class ShowcaseList extends ConsumerWidget {
  final String image;
  final dynamic price;
  final String productName;
  void Function()? onTap;
  ShowcaseList({
    super.key,
    required this.image,
    required this.price,
    required this.productName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration:
            BoxDecoration(color: null, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 10,
              left: 5,
              bottom: 5,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
                top: 30,
                left: 15,
                child: Container(
                  width: 40,
                  height: 20,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 230, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "5.0",
                      style: TextStyle(
                          color: Color.fromARGB(255, 3, 3, 3), fontSize: 12),
                    ),
                  ),
                )),
            Positioned(
                bottom: 90,
                left: 30,
                child: SvgPicture.network(
                  image,
                  width: 130,
                  height: 130,
                )),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  Text("\$ $price",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff074799),
                          fontSize: 13)),
                ],
              ),
            ),
            Positioned(
                bottom: 15,
                right: 15,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Color(0xff074799), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ));
  }
}
