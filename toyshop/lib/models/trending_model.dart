class TrendingModel {
  String image;
  String name;
  int price;
  TrendingModel({
    required this.image,
    required this.name,
    required this.price,
  });
  static List<TrendingModel> trendingList() {
     List<TrendingModel> trendingList = [];
    trendingList.add(TrendingModel(
      image: "lib/assets/icons/ninja1.svg",
      name: "Ninja Blue", 
      price: 100,
    ));
    trendingList.add(TrendingModel(
      image: "lib/assets/icons/jojo.svg",
      name: "Ninja Red", 
      price: 100,
    ));
    trendingList.add(TrendingModel(
      image: "lib/assets/icons/ninja.svg",
      name: "Ninja Green", 
      price: 100,
    ));
    trendingList.add(TrendingModel(
      image: "lib/assets/icons/ninja.svg",
      name: "Labubu", 
      price: 100,
    ));
    return trendingList;
  }
}
