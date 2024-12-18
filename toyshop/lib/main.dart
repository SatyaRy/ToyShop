
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:toyshop/presentation/pages/cart_page.dart";
import "package:toyshop/presentation/pages/home_page.dart";
import "package:toyshop/presentation/pages/intro_page.dart";
import "package:toyshop/presentation/pages/item_detail.dart";
import "package:toyshop/providers/cart_items.dart";
import "package:toyshop/providers/foryou_provider.dart";
import "package:toyshop/providers/trending.dart";

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TrendingProvider()),
        ChangeNotifierProvider(create: (context) => ForyouProvider()),
        ChangeNotifierProvider(create: (context) => CartItemProvider()),
      ],
      child: ChangeNotifierProvider(
          create: (context) => TrendingProvider(),
          builder: (context, child) => MaterialApp(
                theme: ThemeData(fontFamily: "sfpro"),
                debugShowCheckedModeBanner: false,
                home:  const IntroPage(),
                routes: {
                  "/cart": (context) => const CartPage(),
                  "/home": (context) => const HomePage(),
                  "/detail": (context) =>  ItemDetail()
                },
              )),
    );
  }
}
