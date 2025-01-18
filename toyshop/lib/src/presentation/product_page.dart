import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/components/dialog.dart';
import 'package:toyshop/src/presentation/components/app_bar.dart';
import 'package:toyshop/src/presentation/components/toytype_list.dart';
import 'package:toyshop/src/presentation/components/product_list.dart';
import 'package:toyshop/src/model/product/product.dart';
import 'package:toyshop/src/provider/cart/cart.dart';
import 'package:toyshop/src/provider/product_provider.dart';
import 'package:toyshop/src/theme/colors.dart';
class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(getProductProvider);
    final toyTypeList = ref.watch(getToyTypeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: mainAppBar(ref, context),
      backgroundColor:const Color(0xffEEEEEE),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          demoWidget(screenWidth, context),
          const SizedBox(
            height: 20,
          ),
          searchBarWidget(screenWidth),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          toyTypeWidget(toyTypeList),
          titleWidget(),
          const SizedBox(
            height: 15,
          ),
          popularProductWidget(screenWidth, product, ref),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget searchBarWidget(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
          width: screenWidth,
          height: 60,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  hintStyle: GoogleFonts.hanuman(),
                  border: InputBorder.none,
                  hintText: "ស្វែងរកតាមប្រភេទទំនិញ",
                  contentPadding: const EdgeInsets.only(top: 10),
                  suffixIcon: IconButton(
                      onPressed: () {
                        debugPrint('searching ...');
                      },
                      icon: const Icon(Icons.search))),
            ),
          )),
    );
  }
  
  Widget popularProductWidget(double screenWidth,
      AsyncValue<List<ProductModel>> product, WidgetRef ref) {
    return SizedBox(
      height: 250,
      child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: product.when(
              data: (data) {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final value = data[index];
                      final ProductModel productDetail = ProductModel(
                        productID: value.productID,
                        productName: value.productName,
                        productImage: value.productImage,
                        productPrice: value.productPrice,
                        productQuantity: value.productQuantity,
                        productType: value.productType,
                        productDetail: value.productDetail,
                        productStatus: value.productStatus,
                        productRate: 4,
                        timeStamp: "now",
                      );
                      final CartModel cartDetail =
                          CartModel.fromProductModel(productDetail);
                      return ProductTile(
                          productModel: productDetail,
                          onTap: () {
                            ref.read(addToCartProvider(
                              cartDetail,
                            ));
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogBox(
                                      dialogText: "Item added to cart",
                                      dialogColor: AppColors.add);
                                });
                          });
                    });
              },
              error: (error, stackTrace) => Text("$error"),
              loading: () => const CircularProgressIndicator())),
    );
  }

  Widget demoWidget(double screenWidth, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
          height: 200,
          width: screenWidth,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: const Color(0xffEB5B00),
              borderRadius: BorderRadius.circular(15)),
          child: Align(
              alignment: Alignment.centerLeft,
              child: CachedNetworkSVGImage(
                "https://res.cloudinary.com/dnydodget/image/upload/v1735102417/ninja_mfugk0.svg",
                width: MediaQuery.of(context).size.width,
              ))),
    );
  }

  Widget titleWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("កំពុងពេញនិយម",
              style: GoogleFonts.hanuman(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
          TextButton(
              onPressed: () {
                debugPrint("show more...");
              },
              child: const Text("Show more",
                  style: TextStyle(color: Color(0xff074799))))
        ],
      ),
    );
  }

  Widget toyTypeWidget(AsyncValue<List<ProductModel>> toyTypeProvider) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ប្រភេទនៃទំនិញ",
                      style: GoogleFonts.hanuman(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  child: toyTypeProvider.when(
                      data: (value) {
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              final data = value[index];
                              final ToyTypeModel toyTypeModel = ToyTypeModel(
                                  name: data.productName,
                                  image: data.productImage,
                                  star: data.productRate,
                                  price: data.productPrice);
                              return ToyTypeList(toyTypeModel: toyTypeModel);
                            });
                      },
                      error: (error, stackTrace) => Text("$error"),
                      loading: () => null))
            ],
          ),
        ));
  }
}
