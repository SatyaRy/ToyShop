import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/models/trending_model.dart';

// ignore: must_be_immutable
class TrendingList extends StatelessWidget {
  TrendingModel trendingList;
  void Function()? onTap;
  TrendingList({super.key, required this.trendingList,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                trendingList.image,
                width: 180,
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
                        trendingList.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('\$ ${trendingList.price}',
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
        ));
  }
}
