import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/models/trending_model.dart';

// ignore: must_be_immutable
class Trending extends StatelessWidget {
  TrendingModel trending;
  Trending({
    super.key,
    required this.trending,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        decoration: const  BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: [
          SvgPicture.asset(trending.image),
          Text(trending.name),
        ]));
  }
}
