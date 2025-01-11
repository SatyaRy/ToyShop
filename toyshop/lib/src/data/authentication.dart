import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth firebase = FirebaseAuth.instance;
  User? get currentUser => firebase.currentUser;
  Stream<User?> get authStateChange => firebase.authStateChanges();
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await firebase.signInWithEmailAndPassword(
          email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
      await firebase.createUserWithEmailAndPassword(
          email: email, password: password);
  }

  Future<void> signOut() async {
    await firebase.signOut();
  }
}
