import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:toyshop/src/model/product/product.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  ProductModel productModel;
  void Function()? onTap;
  ProductTile({super.key, required this.productModel, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "/detail");
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
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$ ${productModel.productPrice}',
                            style: const TextStyle(color: Color(0xff074799)))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xff074799), shape: BoxShape.circle),
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
