import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toyshop/src/model/product/product.dart';

class ProductService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Future<List<ProductModel>> getProduct() async {
    final snapshot = await db.collection("productDetail").get();
    return snapshot.docs.map((docs) {
      final data = docs.data();
      return ProductModel.fromJson({...data, "productID": docs.id});
    }).toList();
  }

  Future<List<ToyTypeModel>> getToyType() async {
    final snapshot = await db.collection("toyTypeDetail").get();
    return snapshot.docs.map((docs) {
      final data = docs.data();
      return ToyTypeModel.fromJson({...data, "productID": docs.id});
    }).toList();
  }

  Stream<List<ProductModel>> getTrendingToy(String productType) {
    return db
        .collection(productType)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((docs) {
              final data = docs.data();
              return ProductModel.fromJson({...data, "productID": docs.id});
            }).toList());
  }
}
