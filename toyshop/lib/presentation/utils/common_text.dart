import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonText extends StatelessWidget {
  CommonText({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:  const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ));
  }
}
