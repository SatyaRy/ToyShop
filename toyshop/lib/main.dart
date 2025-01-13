import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:toyshop/firebase_options.dart";
import "package:toyshop/src/presentation/signin_page.dart";
import "package:toyshop/src/presentation/signup_page.dart";
import "package:toyshop/src/presentation/cart_page.dart";
import "package:toyshop/src/presentation/home_page.dart";
import "package:toyshop/src/presentation/intro_page.dart";
import "package:toyshop/src/presentation/filter_product_page.dart";
import "package:toyshop/src/provider/auth.dart";
import "package:toyshop/src/provider/initialize.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(userProvider);
    final navigator = ref.watch(navigatorKeyProvider);
    return MaterialApp(
      theme: ThemeData(fontFamily: "sfpro"),
      debugShowCheckedModeBanner: false,
      navigatorKey:navigator ,
      home: authState.when(
          data: (user) {
            if (user == null) {
              return const IntroPage();
            } else {
              return const HomePage();
            }
          },
          error: (error, stacktrace) => Text("$error"),
          loading: () => const CircularProgressIndicator()), 
      routes: {
        "/cart": (context) => CartPage(),
        "/intro": (context) => const IntroPage(),
        "/home": (context) => const HomePage(),
        "/showcase": (context) => const ShowcaseProductPage(),
        "/signup": (context) => SignupPage(),
        "/signin": (context) => SigninPage(),
      },
    );
  }
}
