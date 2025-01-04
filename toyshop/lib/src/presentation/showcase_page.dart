import 'package:flutter/material.dart';
import 'package:toyshop/src/components/silver_appbar.dart';

class ShowcaseProductPage extends StatelessWidget {
  const ShowcaseProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:const Color(0xffEEEEEE),
      body: NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled) =>
        [MyAppBar(pageDetail: "Available",routing: "/home",)],
        body: Container(

        ))

    );
  }
}
