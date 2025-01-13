import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toyshop/src/model/product/product.dart';

class ProductService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Future<List<ProductModel>> getPopularProduct() async {
    final snapshot = await db
        .collection("products")
        .where("productStatus", isEqualTo: "Popular")
        .get(const GetOptions(source: Source.cache));
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
        .get(const GetOptions(source: Source.cache));
    return snapshot.docs.map((docs) {
      final data = docs.data();
      return ProductModel.fromJson(
          {...data, "productID": docs.id, "timeStamp": "now"});
    }).toList();
  }

  Stream<List<ProductModel>> getTrendingToy(String productType) {
    return db
        .collection(productType)
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs.map((docs) {
              final data = docs.data();
              return ProductModel.fromJson({...data, "productID": docs.id});
            }).toList());
  }

  //product based on filtering (trending,best selling...)
  Future<List<ProductModel>> getFilteredProduct(String type) async {
    final snapshot = await db
        .collection("products")
        .where("productStatus", isEqualTo: type)
        .get(const GetOptions(source: Source.cache));
    return snapshot.docs.map((docs) {
      final data = docs.data();
      return ProductModel.fromJson({
        ...data,
        "productID": docs.id,
        "timeStamp": "now",
      });
    }).toList();
  }

  //all products
  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await db
        .collection("products")
        .get(const GetOptions(source: Source.serverAndCache));
    return snapshot.docs.map((docs) {
      debugPrint(
          "snapshot is from: ${snapshot.metadata.isFromCache ? "Cache" : "Server"}");
      final data = docs.data();
      return ProductModel.fromJson(
          {...data, "productID": docs.id, "timeStamp": "now"});
    }).toList();
  }

  Future getProductDetail(String productID) async {
    final snapshot = await db
        .collection("products")
        .doc(productID)
        .get(const GetOptions(source: Source.cache));
    return snapshot.data();
  }
}
