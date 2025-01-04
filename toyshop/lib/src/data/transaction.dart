import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toyshop/src/model/transaction/transaction.dart';

class TransactionService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  //create
  Future<void> deleteAllTransaction(dynamic cost) async {
    await db
        .collection("transactionDetail")
        .where("cost", isEqualTo: cost)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        doc.reference.delete();
      }
    });
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

  double calculateTotal(List<double> cartList) {
    final totalCost = cartList.fold(0.0, (start, end) => start + end);
    return totalCost;
  }

  Future<void> deleteSpecific(String productID) async {
    await db
        .collection("transactionDetail")
        .where("productID", isEqualTo: productID)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        if (doc["productID"] == productID) {
          doc.reference.delete();
          break;
        }
      }
    });
  }
}
