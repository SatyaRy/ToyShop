import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:toyshop/firebase_options.dart";
import "package:toyshop/src/presentation/cart_page.dart";
import "package:toyshop/src/presentation/home_page.dart";
import "package:toyshop/src/presentation/intro_page.dart";
import "package:toyshop/src/presentation/item_detail.dart";


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "sfpro"),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        "/cart": (context) =>  CartPage(),
        "/home": (context) => const HomePage(),
        "/detail": (context) => const ItemDetail()
      },
    );
  }
}
