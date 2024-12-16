import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/models/foryou_model.dart';

// ignore: must_be_immutable
class ForyouList extends StatelessWidget {
  ForYouModel foryouList;
  ForyouList({
    super.key,
    required this.foryouList,
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
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff074799)),
                        shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(foryouList.image),
                  )),
              const SizedBox(
                width: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(foryouList.name,style: const TextStyle(
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
                                foryouList.star,
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
                "\$${foryouList.price}",
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ))
        ],
      ),
    );
  }
}
