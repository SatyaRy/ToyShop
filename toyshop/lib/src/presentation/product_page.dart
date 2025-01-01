import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/src/components/dialog.dart';
import 'package:toyshop/src/components/foryou_list.dart';
import 'package:toyshop/src/components/product_list.dart';
import 'package:toyshop/src/model/product/product.dart';
import 'package:toyshop/src/provider/cart/cart.dart';
import 'package:toyshop/src/provider/product/product_provider.dart';
import 'package:toyshop/src/theme/colors.dart';

const demoToy =
    "https://res.cloudinary.com/dnydodget/image/upload/v1735102417/ninja_mfugk0.svg";

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(getProductProvider);
    final foryouList = ref.watch(getForyouProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        demo(screenWidth, context),
        const SizedBox(
          height: 20,
        ),
        searchBar(screenWidth),
        const SizedBox(
          height: 10,
        ),
        filterMethod(),
        const SizedBox(
          height: 20,
        ),
        foryou(foryouList),
        mostPopular(),
        const SizedBox(
          height: 20,
        ),
        productList(screenWidth, product, ref),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }

  Widget searchBar(double screenWidth) {
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
                  border: InputBorder.none,
                  hintText: "Search for toy..",
                  contentPadding: const EdgeInsets.only(top: 10),
                  suffixIcon: IconButton(
                      onPressed: () {
                        print('searching ...');
                      },
                      icon: const Icon(Icons.search))),
            ),
          )),
    );
  }

  Widget productList(double screenWidth, AsyncValue<List<ProductModel>> product,
      WidgetRef ref) {
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
                        timeStamp: "now",
                      );
                      final CartModel cartDetail =
                          CartModel.fromProductModel(productDetail);

                      return ProductTile(
                          productModel: productDetail,
                          onTap: () {
                            ref.read(AddToCartProvider(
                                cartDetail,
                                cartDetail.productID,
                                cartDetail.productQuantity));
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

  Widget filterMethod() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterBox(
              currentBoxColor: const Color(0xff074799),
              filterText: "Trending",
              filterColor: Colors.white,
              filterWidth: 80),
          const SizedBox(
            width: 10,
          ),
          FilterBox(
            currentBoxColor: Colors.white,
            filterText: "Best Selling",
            filterColor: null,
            filterWidth: 95,
          ),
          const SizedBox(
            width: 10,
          ),
          FilterBox(
            currentBoxColor: Colors.white,
            filterText: "Newest",
            filterColor: null,
            filterWidth: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          FilterBox(
            currentBoxColor: Colors.white,
            filterText: "Oldest",
            filterColor: null,
            filterWidth: 70,
          ),
        ],
      ),
    );
  }

  Widget demo(double screenWidth, BuildContext context) {
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
            child: SvgPicture.network(
              demoToy,
              width: MediaQuery.of(context).size.width,
            ),
          )),
    );
  }

  Widget mostPopular() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Most Popular",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
          TextButton(
              onPressed: () {
                print("show more...");
              },
              child: const Text("Show more",
                  style: TextStyle(color: Color(0xff074799))))
        ],
      ),
    );
  }

  Widget foryou(AsyncValue<List<ForyouModel>> getForyou) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          height: 330,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("For you",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 280,
                  child: getForyou.when(
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

                              final ForyouModel foryouModel = ForyouModel(
                                  name: data.name,
                                  image: data.image,
                                  star: data.star,
                                  price: data.price);
                              return ForyouList(foryouModel: foryouModel);
                            });
                      },
                      error: (error, stackTrace) => Text("$error"),
                      loading: () => const CircularProgressIndicator()))
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class FilterBox extends StatelessWidget {
  Color currentBoxColor;
  String filterText;
  double filterWidth;
  Color? filterColor;
  FilterBox(
      {super.key,
      required this.currentBoxColor,
      required this.filterText,
      required this.filterColor,
      required this.filterWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: filterWidth,
      height: 40,
      decoration: BoxDecoration(
          color: currentBoxColor, borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(
        filterText,
        style: TextStyle(color: filterColor),
      )),
    );
  }
}
