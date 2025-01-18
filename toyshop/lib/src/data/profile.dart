import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:toyshop/src/model/auth/auth.dart';

class ProfileService {
  //read
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserModel> getUserDetail() async {
    final user = auth.currentUser?.uid;
    final snapshot = await db.collection("users").doc(user).get();
    return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  Future<PackageInfo> getAppInfo() async {
    final info = await PackageInfo.fromPlatform();
    return info;
  }
  //update
  Future<void> updateProfile(
      String uid, String infoType, String newInfo) async {
    try {
      await db
        .collection("users")
        .doc(uid)
        .update({
           infoType: newInfo,
        });
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("successfully updated");
    }
  }
  //delete
}
