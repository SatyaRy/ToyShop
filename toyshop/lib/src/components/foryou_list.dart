import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/src/model/product/product.dart';

// ignore: must_be_immutable
class ForyouList extends StatelessWidget {
  ForyouModel foryouModel;
  ForyouList({
    super.key,
    required this.foryouModel,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff074799)),
                        shape: BoxShape.circle,
                    ),
                    child: SvgPicture.network(foryouModel.image,placeholderBuilder: (context)=>const CircularProgressIndicator(),),
                  )),
              const SizedBox(
                width: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(foryouModel.name,style: const TextStyle(
                          fontSize: 17
                        )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          width: 200,
                          child: Row(
                            children: List.generate(
                                foryouModel.star,
                                (_) => const Icon(Icons.star,
                                    color: Colors.orange)),
                          ))
                    ],
                  ))
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "\$${foryouModel.price}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ))
        ],
      ),
    );
  }
}
