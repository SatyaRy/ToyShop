import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toyshop/src/model/product/product.dart';

class ProductService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Future<List<ProductModel>> getPopularProduct() async {
    final snapshot = await db
        .collection("products")
        .where("productStatus", isEqualTo: "Popular")
        .get();
    return snapshot.docs.map((docs) {
      final data = docs.data();
      return ProductModel.fromJson(
          {...data, "productID": docs.id, "timeStamp": "now"});
    }).toList();
  }

  Future<List<ProductModel>> getToyType() async {
    final snapshot = await db
        .collection("products")
        .where("productStatus", isEqualTo: "Type")
        .get();
    return snapshot.docs.map((docs) {
      final data = docs.data();
      return ProductModel.fromJson(
          {...data, "productID": docs.id, "timeStamp": "now"});
    }).toList();
  }

  //product based on filtering (trending,best selling...)
  Future<List<ProductModel>> getFilteredProduct(String type) async {
    final snapshot = await db
        .collection("products")
        .where("productStatus", isEqualTo: type)
        .get(const GetOptions(source: Source.serverAndCache));
    return snapshot.docs.map((docs) {
      final data = docs.data();
      return ProductModel.fromJson({
        ...data,
        "productID": docs.id,
        "timeStamp": "now",
      });
    }).toList();
  }

  //fetching all products
  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await db
        .collection("products")
        .get();
    return snapshot.docs.map((docs) {
      final data = docs.data();
      return ProductModel.fromJson(
          {...data, "productID": docs.id, "timeStamp": "now"});
    }).toList();
  }

  //product detail service
  Future getProductDetail(String productID) async {
    final snapshot = await db
        .collection("products")
        .doc(productID)
        .get(const GetOptions(source: Source.cache));
    return snapshot.data();
  }

}
