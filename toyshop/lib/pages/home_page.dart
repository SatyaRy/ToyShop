import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:toyshop/pages/favorite.dart";
import "package:toyshop/pages/intro_page.dart";
import "package:toyshop/pages/trending_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List pages = [const TrendingPage(), const FavoritePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffEEEEEE),
      appBar: appBar(),
      drawer: drawerSection(),
      floatingActionButton: shop(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottonNav(),
      body: pages[_selectedIndex],
    );
  }

  FloatingActionButton shop() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: const Color(0xff074799),
      onPressed: () {
        Navigator.pushNamed(context, "/cart");
      },
      child: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
    );
  }

  BottomNavigationBar bottonNav() {
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

  Drawer drawerSection() {
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: SvgPicture.asset(
                    "lib/assets/icons/bear.svg",
                    width: 100,
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
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Color(0xff074799),
                      size: 30,
                    ),
                    title: Text("Profile",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const IntroPage()));
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

  AppBar appBar() {
    return AppBar(
      title: const Text("Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
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
            child: SvgPicture.asset('lib/assets/icons/ninja.svg'),
          ),
        )
      ],
    );
  }
}
