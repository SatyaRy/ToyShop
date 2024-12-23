import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyshop/presentation/components/foryou_list.dart';
import 'package:toyshop/presentation/components/image.dart';
import 'package:toyshop/presentation/components/dialog.dart';
import 'package:toyshop/presentation/components/trending_list.dart';
import 'package:toyshop/presentation/models/foryou_model.dart';
import 'package:toyshop/presentation/models/trending_model.dart';
import 'package:toyshop/presentation/theme/colors.dart';
import 'package:toyshop/providers/cart_items.dart';
import 'package:toyshop/providers/foryou_provider.dart';
import 'package:toyshop/providers/trending.dart';

const demoToy = "lib/presentation/assets/icons/ninja.svg";

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});
  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  void addToFavorite(TrendingModel trendingList, double item, int index) {
    Provider.of<TrendingProvider>(context, listen: false)
        .addFavorite(trendingList, index);
    Provider.of<CartItemProvider>(context, listen: false).addToCart(item);
    Provider.of<CartItemProvider>(context, listen: false).totalCost;
    showDialog(
        context: context,
        builder: (context) => DialogBox(
              dialogText: "Item added to cart",
              dialogColor: AppColors.add,
            ));
  }

  Color currentBoxColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    var cartProvider = context.watch<TrendingProvider>();
    var itemQuantity = cartProvider.favoriteList;
    return Consumer<TrendingProvider>(
        builder: (context, value, child) => ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                      height: 200,
                      width: screenWidth,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xffEB5B00),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: ImageSection(image: demoToy),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                      width: screenWidth,
                      height: 60,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for toy..",
                              contentPadding: const EdgeInsets.only(top: 10),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    print('searching ...');
                                  },
                                  icon: const Icon(Icons.search))),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterBox(
                          currentBoxColor: const Color(0xff074799),
                          filterText: "Trending",
                          filterColor: Colors.white,
                          filterWidth: 80),
                      const SizedBox(
                        width: 10,
                      ),
                      FilterBox(
                        currentBoxColor: Colors.white,
                        filterText: "Best Selling",
                        filterColor: null,
                        filterWidth: 95,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FilterBox(
                        currentBoxColor: Colors.white,
                        filterText: "Newest",
                        filterColor: null,
                        filterWidth: 80,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FilterBox(
                        currentBoxColor: Colors.white,
                        filterText: "Oldest",
                        filterColor: null,
                        filterWidth: 80,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                foryou(),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Most Popular",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )),
                      TextButton(
                          onPressed: () {
                            print("show more...");
                          },
                          child: const Text("Show more",
                              style: TextStyle(color: Color(0xff074799))))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 250,
                    width: screenWidth,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 15,
                                ),
                            itemCount: value.trendingList.length,
                            itemBuilder: (context, index) {
                              TrendingModel trendingList =
                                  value.getTrendingList()[index];
                              void increment() {
                                var quantity = itemQuantity[index].quantity;
                                setState(() {
                                  quantity++;
                                });
                              }

                              return TrendingList(
                                onTap: () {
                                  addToFavorite(
                                      trendingList, trendingList.price, index);
                                },
                                trendingList: trendingList,
                              );
                            }))),
                const SizedBox(
                  height: 50,
                )
              ],
            ));
  }

  Padding foryou() {
    var foryouProvider = context.watch<ForyouProvider>();
    var foryouList = foryouProvider.getForYouList();
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          height: 330,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("For you",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 280,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      ForYouModel foryouLists = foryouList[index];
                      return ForyouList(
                        foryouList: foryouLists,
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class FilterBox extends StatelessWidget {
  Color currentBoxColor;
  String filterText;
  double filterWidth;
  Color? filterColor;
  FilterBox(
      {super.key,
      required this.currentBoxColor,
      required this.filterText,
      required this.filterColor,
      required this.filterWidth});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/detail");
        },
        child: Container(
          width: filterWidth,
          height: 40,
          decoration: BoxDecoration(
              color: currentBoxColor, borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(
            filterText,
            style: TextStyle(color: filterColor),
          )),
        ));
  }
}
