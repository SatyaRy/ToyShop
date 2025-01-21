import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:toyshop/src/model/product/product.dart';
import 'package:toyshop/src/presentation/product_widget/product_detail.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  ProductModel productModel;
  void Function()? onTap;
  ProductTile({super.key, required this.productModel, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
            builder: (context) => ProductDetail(productID: productModel.productID)),
            (route) => false);
      },
      child: Container(
          padding: const EdgeInsets.only(top: 10),
          width: 200,
          decoration: BoxDecoration(
           
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Center(
                child: CachedNetworkSVGImage(
                  productModel.productImage,
                  height: 180,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.productName,
                          style: const TextStyle(
                            fontFamily: "sfpro",
                            fontSize: 16,
                            color: Color(0xff212121),
                            fontWeight: FontWeight.bold),
                        ),
                        Text('\$ ${productModel.productPrice}',
                            style: const TextStyle(
                              fontFamily: "sfpro",
                              fontSize: 14,
                              color: Color(0xff091970)))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color(0xff091970), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
