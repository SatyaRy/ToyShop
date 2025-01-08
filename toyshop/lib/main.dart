import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:toyshop/firebase_options.dart";
import "package:toyshop/src/presentation/signin.dart";
import "package:toyshop/src/presentation/signup.dart";
import "package:toyshop/src/presentation/cart_page.dart";
import "package:toyshop/src/presentation/home_page.dart";
import "package:toyshop/src/presentation/intro_page.dart";
import "package:toyshop/src/presentation/item_detail.dart";
import "package:toyshop/src/presentation/showcase_page.dart";
import "package:toyshop/src/provider/authentication/auth.dart";

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
    return MaterialApp(
      theme: ThemeData(fontFamily: "sfpro"),
      debugShowCheckedModeBanner: false,
      home: authState.when(
        data: (user){
          if(user == null){
            return const HomePage();
          }else{
            return const IntroPage();
          }
        }, 
        error: (error,stacktrace)=> Text("$error"), 
        loading: ()=>const CircularProgressIndicator()),
       routes: {
        "/cart": (context) => CartPage(),
        "/intro": (context) => const IntroPage(),
        "/home": (context) => const HomePage(),
        "/detail": (context) => const ItemDetail(),
        "/showcase": (context) => const ShowcaseProductPage(),
        "/signup": (context) => SignupPage(),
        "/signin": (context) => SigninPage(),
      },
    );
  }
}
