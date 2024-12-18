class TrendingModel {
  int id;
  String image;
  String name;
  dynamic price;
  int quantity = 1;
  TrendingModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}
