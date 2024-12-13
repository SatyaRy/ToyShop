import "package:flutter/material.dart";
import "package:toyshop/pages/intro_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      theme: ThemeData(fontFamily: "sfpro"),
      debugShowCheckedModeBanner: false,
      home:  const IntroPage(),
    );
  }
}