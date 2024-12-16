import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/models/trending_model.dart';

// ignore: must_be_immutable
class Favorite extends StatefulWidget {
  TrendingModel favoriteList;
  Favorite({
    super.key,
    required this.favoriteList
  });

  @override
  State<Favorite> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
              color: const Color(0xff074799),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: SvgPicture.asset(widget.favoriteList.image)
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.favoriteList.name,
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 15)),
                          const SizedBox(
                            height: 2,
                          ),
                          Text("\$${widget.favoriteList.price}", style: const TextStyle(color: Colors.white))
                        ],
                      ))
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.favorite, size: 30, color: Colors.red),
              )
            ],
          ));
  }
}
