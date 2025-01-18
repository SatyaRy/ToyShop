import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:toyshop/src/model/auth/auth.dart';


class AuthenticationService {
  final FirebaseAuth firebase = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  User? get currentUser => firebase.currentUser;
  Stream<User?> get authStateChange => firebase.authStateChanges();
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await firebase.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    await firebase.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = firebase.currentUser?.uid;
    if (user!=null) {
      await db.collection("users").doc(user).set(
        UserModel(
          uid: user, 
          username: username,
          email: email, 
          profile: "https://res.cloudinary.com/dnydodget/image/upload/v1736130486/cabybara_dnplgq.svg",
          createAt: DateFormat('EEEE, MMMM d, y').format(DateTime.now())
          ).toJson()
      );
    }
  }

  Future<void> signOut() async {
  
  final user = firebase.currentUser?.uid;
   try{
      await firebase.signOut();
      debugPrint("Successfully signout $user");
   }
   catch(e){
    debugPrint("failed to signout $e");
   }
  }
  
}
