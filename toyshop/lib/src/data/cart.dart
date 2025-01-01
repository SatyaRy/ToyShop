import "package:cloud_firestore/cloud_firestore.dart";
import "package:toyshop/src/data/transaction.dart";
import "package:toyshop/src/model/product/product.dart";
import "package:toyshop/src/model/transaction/transaction.dart";

class CartService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  //Create
  Future<void> addToCart(
      CartModel cartDetail, String productID, int quantity) async {
    await TransactionService().createTransaction(TransactionModel(
        productID: productID,
        price: cartDetail.productPrice,
        delivery: "free",
        createAt: "today",
        createBy: "satyaDev"));
    await TransactionService().getTransaction();
    final querySnapshot = await db
        .collection("cartDetail")
        .where("productID", isEqualTo: productID)
        .get();
    //filter productID and check isDuplicated
    if (querySnapshot.docs.isNotEmpty) {
      final docsID = querySnapshot.docs.first.id;
      await db
          .collection("cartDetail")
          .doc(docsID)
          .update({"productQuantity": FieldValue.increment(1)});
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
              return CartModel.fromJson({...data, "productID": docs.id});
            }).toList());
    return data;
  }

  //delete
  Future<void> deleteItem(String? cartID) {
    return db.collection("cartDetail").doc(cartID).delete();
  }

  Future<void> increment(String? cartID) {
    final data = db
        .collection("cartDetail")
        .doc(cartID)
        .update({"productQuantity": FieldValue.increment(1)});
    return data;
  }

  Future<void> decrement(String? cartID, int quantity) async {
    if (quantity > 1) {
      quantity--;
    }
    await db
        .collection("cartDetail")
        .doc(cartID)
        .update({"productQuantity": quantity});
  }
}
