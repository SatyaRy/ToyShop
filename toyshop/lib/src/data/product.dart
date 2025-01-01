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
  Stream<List<ForyouModel>> getForyou() {
    return db
        .collection("foryouDetail")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((docs) {
              final data = docs.data();
              return ForyouModel.fromJson({...data, "id": docs.id});
            }).toList());
  }
}
