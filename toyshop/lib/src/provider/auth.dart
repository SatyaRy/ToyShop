import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/authentication.dart';

//access auth service
final authenticationProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService();
});

//check if user exist
final isUserProvider = StreamProvider<User?>((ref) {
  final service = ref.watch(authenticationProvider);
  return service.authStateChange;
});

//sign out in firebase auth
final signoutProvider = FutureProvider((ref) {
  final service = ref.watch(authenticationProvider);
  return service.signOut();
});


class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);
  void isEmpty() {
    state = true;
  }
  void isNotEmpty() {
    state = false;
  }
}
final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier();
});
