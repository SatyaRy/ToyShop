import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/foundation.dart";
import "package:toyshop/src/data/transaction.dart";
import "package:toyshop/src/model/product/product.dart";

class CartService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  //Create
  Future<void> addToCart(CartModel cartDetail) async {
    await TransactionService()
        .createTransaction(cartDetail.productPrice, cartDetail.productID);
    final querySnapshot = await db
        .collection("cartDetail")
        .where("productID", isEqualTo: cartDetail.productID)
        .get(const GetOptions(source: Source.cache));
    //filter productID and check isDuplicated
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        await doc.reference
            .update({"productQuantity": FieldValue.increment(1)});
      }
    } else {
      await db.collection("cartDetail").add(cartDetail.toJson());
    }
  }

  //read
  Stream<List<CartModel>> getCartItems() {
    final data = db
        .collection("cartDetail")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((docs) {
              final data = docs.data();
              return CartModel.fromJson({...data});
            }).toList());
    return data;
  }

  //delete
  Future<void> deleteItem(String cartID, dynamic cost) async {
    final snapshot = await db
        .collection("cartDetail")
        .where(
          "productID",
          isEqualTo: cartID,
        )
        .get(const GetOptions(source: Source.cache));
    final batch = db.batch();
    for (var doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await TransactionService().deleteAllTransaction(cartID);
    await batch.commit();
  }

  Future<void> decrementQuantity(String cartID, int quantity) async {
    final snapshot = await db
        .collection("cartDetail")
        .where("productID", isEqualTo: cartID)
        .get(const GetOptions(source: Source.cache));
    for (var doc in snapshot.docs) {
      final data = doc["productQuantity"];
      if (data > 1) {
        await doc.reference.update({
          "productQuantity": FieldValue.increment(-1),
        });
      } else {
        return;
      }
    }
  }

  Future<void> incrementQuantity(String? cartID) async {
    final snapshot = await db
        .collection("cartDetail")
        .where("productID", isEqualTo: cartID)
        .get(const GetOptions(source: Source.cache));
    for (var doc in snapshot.docs) {
      await doc.reference.update({"productQuantity": FieldValue.increment(1)});
    }
  }
}
