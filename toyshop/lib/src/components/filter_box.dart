import 'package:flutter/material.dart';

class FilterBox extends StatelessWidget {
  Color currentBoxColor;
  String filterText;
  double filterWidth;
  Color? filterColor;
  void Function()? onTap;
  FilterBox(
      {super.key,
      required this.currentBoxColor,
      required this.filterText,
      required this.filterColor,
      required this.onTap,
      required this.filterWidth});

  String productType = "trendingList";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: filterWidth,
        height: 40,
        decoration: BoxDecoration(
            color: currentBoxColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
          filterText,
          style: TextStyle(color: filterColor),
        )),
      ),
    );
  }
}
