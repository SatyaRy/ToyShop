import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/presentation/modal_widget/dialog.dart';
import 'package:toyshop/src/model/product/product.dart';
import 'package:toyshop/src/provider/cart/cart.dart';
import 'package:toyshop/src/provider/transaction.dart';
import 'package:toyshop/src/theme/colors.dart';

// ignore: must_be_immutable
class CartList extends ConsumerWidget {
  final CartModel cartDetail;
  const CartList({
    super.key,
    required this.cartDetail,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              image(),
              const SizedBox(
                width: 20,
              ),
              detail(),
            ],
          ),
          operation(cartDetail, ref, context),
        ],
      ),
    );
  }

  Widget operation(CartModel cartDetail, WidgetRef ref, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              ref.read(deleteCartProvider((
                cartID: cartDetail.productID,
                cost: cartDetail.productPrice
              )));
              ref.invalidate(deleteCartProvider);
              showDialog(
                  context: context,
                  builder: (context) => DialogBox(
                       
                      dialogText: "ទំនិញត្រូវបានដកពីកន្ត្រក",
                      dialogColor: AppColors.remove));
            },
            child:
                const Icon(Icons.delete_outline, size: 30, color: Colors.red),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(cartServiceProvider).decrementQuantity(
                        cartDetail.productID, cartDetail.productQuantity);
                    ref.read(deleteOnDecrement((
                      productID: cartDetail.productID,
                      productQuantity: cartDetail.productQuantity
                    )));
                    ref.invalidate(deleteOnDecrement);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color(0xffF72C5B),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(cartDetail.productQuantity.toString(),style: 
                const TextStyle(
                  fontSize: 16,
                  fontFamily: "sfpro"
                ),),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(cartServiceProvider)
                        .incrementQuantity(cartDetail.productID);
                    ref.read(reCalculate(ProductParams(
                            cartDetail.productID, cartDetail.productPrice))
                        .future);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: const Color(0xff0a33f9),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget detail() {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(cartDetail.productName,
              style:
                  const TextStyle(
                    fontFamily: "sfpro",
                    fontWeight: FontWeight.bold, fontSize: 16)),
          const Text("soft-toy",
              style: TextStyle(
                fontFamily: "sfpro",
                fontSize: 14,
                color: Color.fromARGB(255, 86, 86, 86))),
          const SizedBox(
            height: 5,
          ),
          Text(
            "\$${cartDetail.productPrice}",
            style: const TextStyle(
              fontFamily: "sfpro",
              fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
          child: CachedNetworkSVGImage(cartDetail.productImage)),
    );
  }
}
