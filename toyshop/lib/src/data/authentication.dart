import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth firebase = FirebaseAuth.instance;
  User? get currentUser => firebase.currentUser;
  Stream<User?> get authStateChange => firebase.authStateChanges();
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await firebase.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<String?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebase.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "week-password":
          return 'The password provided is too weak.';
        case 'email-already-in-use':
          return 'The account already exists for that email.';
        case 'invalid-email':
          return 'The email address is not valid.';
      }
    } catch (e) {
      return "Error try again $e";
    }
  }

  Future<void> signOut() async {
    await firebase.signOut();
  }
}
