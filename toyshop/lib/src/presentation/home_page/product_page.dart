import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/presentation/modal_widget/dialog.dart';
import 'package:toyshop/src/presentation/components/app_bar.dart';
import 'package:toyshop/src/presentation/modal_widget/handle_message.dart';
import 'package:toyshop/src/presentation/components/toytype_tile.dart';
import 'package:toyshop/src/presentation/components/popular.tile.dart';
import 'package:toyshop/src/model/product/product.dart';
import 'package:toyshop/src/presentation/components/product_slider.dart';
import 'package:toyshop/src/provider/cart/cart.dart';
import 'package:toyshop/src/provider/product_provider.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: mainAppBar(ref, context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          const ProductSliders(),
          const SizedBox(
            height: 30,
          ),
          const ToyType(),
          const SizedBox(
            height: 30,
          ),
          titleWidget(context),
          const SizedBox(
            height: 15,
          ),
          const PopularProduct(),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget titleWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("កំពុងពេញនិយម", style: Theme.of(context).textTheme.titleMedium),
          TextButton(
              onPressed: () {
              },
              child: const Text("Show more",
                  style: TextStyle(color: Color(0xff074799))))
        ],
      ),
    );
  }
}

class ProductSliders extends ConsumerWidget {
  const ProductSliders({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularProduct = ref.watch(getProductProvider);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: popularProduct.when(
            data: (data) => SizedBox(
                  height: 200,
                  child: CarouselSlider.builder(
                      itemCount: data.length,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                      ),
                      itemBuilder: (BuildContext context, index, value) {
                        final image = data[index];
                        return ProductSlider(data: image.productImage);
                      }),
                ),
            error: (error, StackTrace st) => Text("$error"),
            loading: () => const BuildLoadingWidget()));
  }
}

class PopularProduct extends ConsumerWidget {
  const PopularProduct({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productProvider = ref.watch(getProductProvider);
    return SizedBox(
      height: 250,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: productProvider.when(
              data: (data) {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final value = data[index];
                      final CartModel cartDetail =
                          CartModel.fromProductModel(value);
                      return ProductTile(
                          productModel: value,
                          onTap: () {
                            ref.read(addToCartProvider(
                              cartDetail,
                            ));
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogBox(
                                      dialogText: "ទំនិញបានដាក់ចូលកន្ត្រក",
                                      dialogColor: const Color(0xff00A800));
                                });
                          });
                    });
              },
              error: (error, stackTrace) => Text("$error"),
              loading: () => const BuildLoadingWidget())),
    );
  }
}

class ToyType extends ConsumerWidget {
  const ToyType({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toyTypeProvider = ref.watch(getToyTypeProvider);
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ប្រភេទនៃទំនិញ",
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 450,
                child: toyTypeProvider.when(
                    data: (value) {
                      return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 15,
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
                    loading: () => const BuildLoadingWidget()))
          ],
        ),
      ),
    );
  }
}
