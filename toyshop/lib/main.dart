import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:toyshop/firebase_options.dart";
import "package:toyshop/src/presentation/auth/account_page.dart";
import "package:toyshop/src/presentation/auth/setting_page.dart";
import "package:toyshop/src/presentation/auth/signin_page.dart";
import "package:toyshop/src/presentation/auth/signup_page.dart";
import "package:toyshop/src/presentation/product_widget/cart_page.dart";
import "package:toyshop/src/presentation/favorite_page/favorite_page.dart";
import "package:toyshop/src/presentation/home_page/home_page.dart";
import "package:toyshop/src/presentation/intro/intro_page.dart";
import "package:toyshop/src/presentation/product_widget/filter_product_page.dart";
import "package:toyshop/src/presentation/auth/user_detail.dart";
import "package:toyshop/src/provider/auth.dart";
import "package:toyshop/src/theme/theme.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(isUserProvider);
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
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
        "/profile": (context) => const ProfilePage(),
        "/userDetail": (context) => const UserDetailPage(),
        "/setting":(context)=> const SettingPage(),
        "/favorite":(context)=> const FavoritePage(),
      },
    );
  }
}
