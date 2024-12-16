import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyshop/components/foryou_list.dart';
import 'package:toyshop/components/image.dart';
import 'package:toyshop/components/success.dart';
import 'package:toyshop/components/trending_list.dart';
import 'package:toyshop/models/foryou_model.dart';
import 'package:toyshop/models/trending_model.dart';
import 'package:toyshop/providers/cart_items.dart';
import 'package:toyshop/providers/foryou_provider.dart';
import 'package:toyshop/providers/trending.dart';

const demoToy = "lib/assets/icons/ninja.svg";

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});
  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  void addToFavorite(TrendingModel trendingList, int item) {
    Provider.of<TrendingProvider>(context, listen: false)
        .addFavorite(trendingList);
    Provider.of<CartItemProvider>(context, listen: false).addToCart(item);
    Provider.of<CartItemProvider>(context, listen: false).totalCost;
    showDialog(context: context, builder: (context) => const SuccessDialog());
  }

  Color currentBoxColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: const Color(0xff074799),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Text("Trending",
                                      style: TextStyle(color: Colors.white))))),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 95,
                            height: 40,
                            decoration: BoxDecoration(
                                color: currentBoxColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(child: Text("Best Selling")),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                                color: currentBoxColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(child: Text("Newest")),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                                color: currentBoxColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(child: Text("Oldest")),
                          )),
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
                              return TrendingList(
                                onTap: () {
                                  addToFavorite(
                                      trendingList, trendingList.price);
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
