# MoMo - ToyShop Project

The **ToyShop project** is a user-friendly application designed to provide an engaging online shopping experience for purchasing toys. It caters to toy enthusiasts of all ages and offers a wide range of products, from educational and STEM toys to plush toys, action figures, and collectibles.

## Features

- **Search/Filter** your favorite toy
- View **Toy details and price**
- **Purchase** in just **3 clicks**
- Enjoy **Fast Delivery**

---

### About
MoMo simplifies toy shopping with a streamlined interface, making it easy for users to explore, select, and purchase toys effortlessly.





 ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 15,
                                ),
                            itemCount: value.trendingList.length,
                            itemBuilder: (context, index) {
                              TrendingModel trendingList =
                                  value.getTrendingList()[index];
                              void addToCart() {
                                addToFavorite(
                                  trendingList,
                                  trendingList.price,
                                );
                                setState(() {
                                  trendingList.quantity++;
                                });
                               
                              }
                              return TrendingList(
                                onTap: () {
                                  addToCart();
                                },
                                trendingList: trendingList,
                              );
                            }



 ListView(
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
                      child:  Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.network(demoToy,width: MediaQuery.of(context).size.width,),
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
                        filterWidth: 70,
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
                              void addToCart() {
                                addToFavorite(
                                  trendingList,
                                  trendingList.price,
                                );
                                setState(() {
                                  trendingList.quantity++;
                                });
                               
                              }
                              return TrendingList(
                                onTap: () {
                                  addToCart();
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
        )