import 'package:cloud_firestore/cloud_firestore.dart';


class TransactionService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  //create
  Future<void> deleteAllTransaction(String productID) async {
    final snapshot = await db
        .collection("transactionDetail")
        .where("productID", isEqualTo: productID)
        .get(const GetOptions(source: Source.cache));
    final batch = db.batch();
    for (var doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  Future<void> createTransaction(dynamic price, String productID) async {
    await db.collection("transactionDetail").add({
      "productID": productID,
      "cost": price,
    });
  }

  Stream<List<double>> getTransaction() {
    return db
        .collection("transactionDetail")
        .snapshots() //realtime
        .map((snapshot) {
      return snapshot.docs
          .map((docs) => (docs["cost"] as num).toDouble())
          .toList();
    });
  }

  Stream<List<int>> getQuantity() {
    return db.collection("cartDetail").snapshots().map((snapshot) =>
        snapshot.docs.map((docs) => (docs["productQuantity"] as int)).toList());
  }

  double calculateTotal(List<double> cartList) {
    final totalCost = cartList.fold(0.0, (start, end) => start + end);
    return totalCost;
  }

  int calculateQuanity(List<int> quantity) {
    final totalQuantity = quantity.fold(0, (start, end) => start + end);
    return totalQuantity;
  }

  Future<void> deleteSpecific(String productID,int quantity) async {
   if(quantity> 1){
     final snapshot = await db
        .collection("transactionDetail")
        .where("productID", isEqualTo: productID)
        .get(const GetOptions(source: Source.cache));
    for (var doc in snapshot.docs) {
        await doc.reference.delete();
        break;
    }
   }
  }
}
