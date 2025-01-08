import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toyshop/src/model/product/product.dart';

class ProductService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Stream<List<ProductModel>> getProduct() {
    return db
        .collection("productDetail")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((docs) {
              final data = docs.data();
              return ProductModel.fromJson({...data, "productID": docs.id});
            }).toList());
  }

  Stream<List<ToyTypeModel>> getToyType() {
    return db
        .collection("toyTypeDetail")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((docs) {
              final data = docs.data();
              return ToyTypeModel.fromJson({...data, "id": docs.id});
            }).toList());
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
