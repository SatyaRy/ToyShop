
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:google_fonts/google_fonts.dart";
import "package:toyshop/src/presentation/components/handle_message.dart";
import "package:toyshop/src/presentation/favorite_page.dart";
import "package:toyshop/src/presentation/product_page.dart";
import "package:toyshop/src/presentation/auth/account_page.dart";
import "package:toyshop/src/presentation/searching_page.dart";
import "package:toyshop/src/provider/initialize.dart";

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List pages = [const ProductPage(), const SearchingPage(), const ProfilePage()];
  final List pagesTitle = ["អីវ៉ាន", "ចូលចិត្ត", "គណនី"];
  @override
  Widget build(BuildContext context) {
    final initApp = ref.watch(initializeAppProvider);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffEEEEEE),
      bottomNavigationBar: bottonNav(),
      body: initApp.when(
          data: (_) => pages[_selectedIndex],
          error: (erorr, stractrace) => null,
          loading: () => buildLoadingWidget()),
    );
  }

  Widget shop() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: const Color(0xff074799),
      onPressed: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/cart", (route) => false);
      },
      child: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
    );
  }

  Widget bottonNav() {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff074799),
        onTap: (value) => navigateBottomBar(value),
        unselectedLabelStyle: GoogleFonts.hanuman(

            color: Colors.black),
        selectedLabelStyle: GoogleFonts.hanuman(
         
            height: 1.8, color: Colors.black),
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.shopping_cart_outlined,color: Color(0xff074799)),
            icon: Icon(Icons.dashboard_customize, color: Color(0xff686D76)),
            label: "អីវ៉ាន់",
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.search_outlined,color: Color(0xff074799)),
              icon: Icon(Icons.search_outlined, color: Color(0xff686D76)),
              label: "ស្វែងរក"),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person_outline,color: Color(0xff074799)),
              icon: Icon(Icons.person_outline, color: Color(0xff686D76)),
              label: "គណនី"),
        ]);
  }
}
