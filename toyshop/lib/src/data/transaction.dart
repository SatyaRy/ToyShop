import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toyshop/src/model/transaction/transaction.dart';

class TransactionService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  static List<dynamic> total = [];
  //create
  Future<dynamic> createTransaction(TransactionModel transactionDetail) async {
    db.collection("transactionDetail").add(transactionDetail.toJson());
  }

  Future<dynamic> getTransaction() async {
    QuerySnapshot querySnapshot =
        await db.collection("transactionDetail").get();
    for (var doc in querySnapshot.docs) {
      final data = doc.get("price");
      total.add(data);
    }
  }
}
