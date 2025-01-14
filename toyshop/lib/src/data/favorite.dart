import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:toyshop/src/model/product/product.dart';

class FavoriteService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  //create
  Future<void> addFavoriteProduct(
      String productID, FavoriteModel favoriteModel) async {
    try {
      final user = auth.currentUser?.uid;
      final snapshot = await db
          .collection("users")
          .doc(user)
          .collection("favorite")
          .where("productID", isEqualTo: productID)
          .get(const GetOptions(source: Source.serverAndCache));
      //check if item is duplicated
      if (snapshot.docs.isNotEmpty) {
        debugPrint("Item already added to favorite");
        return;
      } else {
        await db
        .collection("users")
        .doc(user)
        .collection("favorite")
        .add(favoriteModel.toJson());
        debugPrint("Successfully added to favorite");
      }
    } on FirebaseException catch (e) {
      debugPrint("$e");
    }
  }

 
  //read
  Stream<List<FavoriteModel>> getFavoriteProduct() {
    final user = auth.currentUser?.uid;
    return db
        .collection("users")
        .doc(user)
        .collection("favorite")
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) {
      return snapshot.docs.map((docs) {
        final data = docs.data();
        return FavoriteModel.fromJson({...data});
      }).toList();
    });
  }

  //delete
  Future<void> deleteFromFavorite(String productID) async {
    try {
      final user = auth.currentUser?.uid;
      final snapshot = await db
          .collection("users")
          .doc(user)
          .collection("favorite")
          .where("productID", isEqualTo: productID)
          .get(const GetOptions(source: Source.cache));
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
      debugPrint("Successfully removed");
    } catch (e) {
      debugPrint("$e");
    }
  }
}
