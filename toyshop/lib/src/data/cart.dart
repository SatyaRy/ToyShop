import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:toyshop/src/data/transaction.dart";
import "package:toyshop/src/model/product/product.dart";

class CartService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  //Create
  Future<void> addToCart(CartModel cartDetail) async {
    final user = auth.currentUser?.uid;
    await TransactionService()
        .createTransaction(cartDetail.productPrice, cartDetail.productID);
    final querySnapshot = await db
        .collection("users")
        .doc(user)
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
      await db
          .collection("users")
          .doc(user)
          .collection("cartDetail")
          .add(cartDetail.toJson());
    }
  }

  //read
  Stream<List<CartModel>> getCartItems() {
    final user = auth.currentUser?.uid;
    final data = db
        .collection("users")
        .doc(user)
        .collection("cartDetail")
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot.docs.map((docs) {
              final data = docs.data();
              return CartModel.fromJson({...data});
            }).toList());
    return data;
  }

  //delete
  Future<void> deleteItem(String cartID, dynamic cost) async {
    final user = auth.currentUser?.uid;
    final snapshot = await db
        .collection("users")
        .doc(user)
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
    final user = auth.currentUser?.uid;
    final snapshot = await db
        .collection("users")
        .doc(user)
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
    final user = auth.currentUser?.uid;
    final snapshot = await db
        .collection("users")
        .doc(user)
        .collection("cartDetail")
        .where("productID", isEqualTo: cartID)
        .get(const GetOptions(source: Source.cache));
    for (var doc in snapshot.docs) {
      await doc.reference.update({"productQuantity": FieldValue.increment(1)});
    }
  }
}
