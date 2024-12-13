import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/components/image.dart';
import 'package:toyshop/models/search_box.dart';
import 'package:toyshop/models/trending_model.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});
  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  List<TrendingModel> trendingList = [];
  List<SearchBox> searchBox = [];
  void initInfo() {
    trendingList = TrendingModel.trendingList();
    searchBox = SearchBox.searchBox();
  }
  Color currentBoxColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    initInfo();
    final double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
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
                child: ImageSection(image: "lib/assets/icons/ninja.svg"),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                            style: TextStyle(color: Colors.white))),
                  )),
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
        const SizedBox(height: 20,),
        Padding(
          padding:  const EdgeInsets.only(left: 20, right: 20),
          child:  Container(
            height: 250,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("For you",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    )),],),
               const SizedBox(height: 10,),
               Container(
                height: 75,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff074799)),
                            shape: BoxShape.circle
                          ),
                          child: SvgPicture.asset("lib/assets/icons/ninja1.svg"),
                        )
                        ),
                        const SizedBox(width: 20,),
                        const Padding(
                          padding:  EdgeInsets.only(top: 10),
                          child:   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Super Ninja Blue"),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.orange,),
                                Icon(Icons.star,color: Colors.orange,),
                                Icon(Icons.star,color: Colors.orange,),
                                Icon(Icons.star,color: Colors.orange,),
                              ],
                            )
                          ],
                        )
                        )],),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text("\$5.00",style: TextStyle(
                          color: Colors.orange,
                          fontSize: 15
                        ),)
                      )

                  ],
                ),
                )
              ],
            ),
          )
        ),
        const SizedBox(height: 10),
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
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 15,
                        ),
                    itemCount: trendingList.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                  trendingList[index].image,
                                  width: 180,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          trendingList[index].name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('\$ ${trendingList[index].price}',
                                            style: const TextStyle(
                                                color: Color(0xff074799)))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff074799),
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.add,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ));
                    }))),
      ],
    );
  }
}
