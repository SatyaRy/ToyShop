import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  String routing;
  String pageDetail;
  MyAppBar({
    super.key,
    required this.routing,
    required this.pageDetail,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xffEEEEEE),
      title: Text(
        pageDetail,
        style: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.only(left: 5),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 0.5,
                  offset: Offset(1, 0.5),
                )
              ]),
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, routing);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
        ),
      ),
    );
  }
}