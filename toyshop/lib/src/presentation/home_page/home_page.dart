import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:google_fonts/google_fonts.dart";
import "package:toyshop/src/presentation/modal_widget/handle_message.dart";
import "package:toyshop/src/presentation/home_page/product_page.dart";
import "package:toyshop/src/presentation/auth/account_page.dart";
import "package:toyshop/src/presentation/searching_page/searching_page.dart";
import "package:toyshop/src/provider/initialize.dart";

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initApp = ref.watch(initializeAppProvider);
    return Scaffold(
      bottomNavigationBar:  const BottomNavigation(),
      body: initApp.when(
          data: (_) =>const HomeContent(),
          error: (erorr, stractrace) => null,
          loading: () => const BuildLoadingWidget()),
    );
  }
}

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectIndexProvider);
    const List pages = [
     ProductPage(),
     SearchingPage(),
     ProfilePage()
  ];
    return pages[index];
  }
}

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectIndexProvider);
    final labelStyle = GoogleFonts.hanuman(height: 1.8);
   final unselectedLabelStyle = GoogleFonts.hanuman(color: Colors.black);
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: index,
      
        selectedItemColor: const Color(0xff091970),
        onTap: (value) =>
            ref.read(selectIndexProvider.notifier).changeIndex(value),
        unselectedLabelStyle:unselectedLabelStyle,
        selectedLabelStyle:labelStyle,
        items: const [
          BottomNavigationBarItem(
            activeIcon:
                Icon(Icons.shopping_cart_outlined, color: Color(0xff091970)),
            icon: Icon(Icons.shopping_cart_outlined, color: Color(0xff212121)),
            label: "អីវ៉ាន់",
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.search_outlined, color: Color(0xff091970)),
              icon: Icon(Icons.search_outlined, color: Color(0xff212121)),
              label: "ស្វែងរក"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person_outline, color: Color(0xff091970)),
              icon: Icon(Icons.person_outline, color: Color(0xff212121)),
              label: "គណនី"),
        ]);
  }
}
