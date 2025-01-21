import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:toyshop/src/model/product/product.dart';

// ignore: must_be_immutable
class ToyTypeList extends StatelessWidget {
  ToyTypeModel toyTypeModel;
  ToyTypeList({
    super.key,
    required this.toyTypeModel,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/showcase");
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1)
              )
            ],
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 76, 145, 236),
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkSVGImage(
                          toyTypeModel.image,
                          placeholderBuilder: (context) =>
                              const CircularProgressIndicator()
                        ))),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(toyTypeModel.name,
                              style: const TextStyle(
                                fontFamily: "sfpro",
                                fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                color: Color(0xff212121),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: 200,
                            child: Row(
                              children: List.generate(
                                  toyTypeModel.star,
                                  (_) => const Icon(Icons.star,
                                      color: Colors.orange)),
                            ))
                      ],
                    ))
              ],
            ),
            const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "10%",
                  style: TextStyle(
                    fontFamily: "sfpro",
                    color: Color(0xff212121), fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
