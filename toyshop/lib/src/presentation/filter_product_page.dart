import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/components/dialog.dart';
import 'package:toyshop/src/presentation/components/filter_box.dart';
import 'package:toyshop/src/presentation/components/handle_message.dart';
import 'package:toyshop/src/presentation/components/app_bar.dart';
import 'package:toyshop/src/model/product/product.dart';
import 'package:toyshop/src/presentation/product_detail.dart';
import 'package:toyshop/src/provider/cart/cart.dart';
import 'package:toyshop/src/provider/product_provider.dart';
import 'package:toyshop/src/theme/colors.dart';

class ShowcaseProductPage extends ConsumerWidget {
  const ShowcaseProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meidaQuery = MediaQuery.of(context).size;
    final productType = ref.watch(filterProvider);
    final filteredProduct = ref.watch(getProductsProvider(productType));
    Color getButtonColor(String changeProductType) {
      return productType == changeProductType
          ? const Color(0xff074799)
          : Colors.white;
    }

    return Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  MyAppBar(
                    pageDetail: "",
                    routing: "/home",
                    onTap: ()=> Navigator
                    .of(context)
                    .pushNamedAndRemoveUntil("/home", (Route<dynamic>route)=>false),
                  )
                ],
            body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                     Text("ស្វែងរកទំនិញដែលអ្នកពេញចិត្តខាងក្រោម",
                        style: GoogleFonts.hanuman(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    filterMethods(meidaQuery, getButtonColor, productType, ref),
                    const SizedBox(
                      height: 10,
                    ),
                    filteredProduct.when(
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
                                productID: data.productID,
                                image: data.productImage,
                                price: data.productPrice,
                                productName: data.productName,
                                onTap: () {
                                  ref.read(addToCartProvider(cartModel));
                                  showDialog(
                                      context: context,
                                      builder: (context) => DialogBox(
                                          dialogText: "ទំនិញត្រូវបានដាក់ចូលកន្ត្រក",
                                          dialogColor: AppColors.add));
                                },
                              );
                            },
                          );
                        },
                        error: (error, stacktrace) => Text("$error"),
                        loading: () => Center(child: buildLoadingWidget())),
                    const SizedBox(height: 50)
                  ],
                ))));
  }

  Widget filterMethods(
      Size meidaQuery,
      Color Function(String changeProductType) getButtonColor,
      String productType,
      WidgetRef ref) {
    return Container(
      width: meidaQuery.width,
      height: 80,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          FilterBox(
              currentBoxColor: getButtonColor("Trending"),
              filterText: "ពេញនិយម",
              filterColor:
                  productType == "Trending" ? Colors.white : Colors.black,
              onTap: () {
                ref.read(filterProvider.notifier).changeFilter("Trending");
              },
              filterWidth: 80),
          FilterBox(
              currentBoxColor: getButtonColor("Best Selling"),
              filterText: "លក់ដាច់",
              filterColor:
                  productType == "Best Selling" ? Colors.white : Colors.black,
              onTap: () {
                ref.read(filterProvider.notifier).changeFilter("Best Selling");
              },
              filterWidth: 90),
          FilterBox(
              currentBoxColor: getButtonColor("Newest"),
              filterText: "ថ្មីៗ",
              filterColor:
                  productType == "Newest" ? Colors.white : Colors.black,
              onTap: () {
                ref.read(filterProvider.notifier).changeFilter("Newest");
              },
              filterWidth: 90),
          FilterBox(
              currentBoxColor: getButtonColor("Oldest"),
              filterText: "ចាស់ៗ",
              filterColor:
                  productType == "Oldest" ? Colors.white : Colors.black,
              onTap: () {
                ref.read(filterProvider.notifier).changeFilter("Oldest");
              },
              filterWidth: 90),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ShowcaseList extends ConsumerWidget {
  final String productID;
  final String image;
  final dynamic price;
  final String productName;
  void Function()? onTap;
  ShowcaseList({
    super.key,
    required this.productID,
    required this.image,
    required this.price,
    required this.productName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(productID: productID)),
            (Route<dynamic> route) => false)
      },
      child: Container(
          decoration: BoxDecoration(
              color: null, 
              
              borderRadius: BorderRadius.circular(10)),
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
                       boxShadow:const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0,1.5)) ],
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
                  child: CachedNetworkSVGImage(
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
          )),
    );
  }
}
