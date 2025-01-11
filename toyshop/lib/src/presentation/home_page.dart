import "package:cached_network_svg_image/cached_network_svg_image.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:toyshop/src/components/handle_message.dart";
import "package:toyshop/src/data/authentication.dart";
import "package:toyshop/src/presentation/favorite_page.dart";
import "package:toyshop/src/presentation/product_page.dart";
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

  final List pages = [const ProductPage(), const FavoritePage()];
  final List pagesTitle = ["Home", "Favorite"];
  @override
  Widget build(BuildContext context) {
    final initApp = ref.watch(initializeAppProvider);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffEEEEEE),
      appBar: appBar(_selectedIndex),
      drawer: drawerSection(),
      floatingActionButton: shop(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottonNav(),
      body: initApp.when(
        data: (_)=> pages[_selectedIndex], 
        error: (erorr, stractrace)=> null, 
        loading: ()=> buildLoadingWidget()
        ),
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
        onTap: (value) => navigateBottomBar(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize,
                size: 30, color: Color(0xff074799)),
            label: "Customize",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, color: Color(0xff074799)),
              label: "Favorite"),
        ]);
  }

  Widget drawerSection() {
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: CachedNetworkSVGImage(
                    "https://res.cloudinary.com/dnydodget/image/upload/v1735102422/toyshop_scok5w.svg",
                    width: 700,
                    height: 200,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      size: 30,
                      color: Color(0xff074799),
                    ),
                    title: Text("Home",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      size: 30,
                      color: Color(0xff074799),
                    ),
                    title: Text("About",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        color: Color(0xff074799),
                        size: 30,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/signin", (route) => false);
                        },
                        child: const Text("Profile",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      )),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                AuthenticationService().signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/intro", (route) => false);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 50),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 30,
                    color: Color(0xff074799),
                  ),
                  title: Text("Logout",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ),
            )
          ],
        ));
  }

  AppBar appBar(index) {
    return AppBar(
      title: Text(pagesTitle[index],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          )),
      backgroundColor: const Color(0xffEEEEEE),
      leading: Builder(
          builder: (context) => Container(
                margin: const EdgeInsets.only(left: 20),
                child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.sort,
                      size: 40,
                      color: Colors.black,
                    )),
              )),
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      actions: [
        GestureDetector(
          child: Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: CachedNetworkSVGImage("https://res.cloudinary.com/dnydodget/image/upload/v1735102417/ninja_mfugk0.svg")
          ),
        )
      ],
    );
  }
}
