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

class IsVisible extends StateNotifier<bool> {
  IsVisible() : super(false);
  void isClick() {
    state = !state;
  }
}
final isVisibleProvider = StateNotifierProvider<IsVisible, bool>((ref) {
  return IsVisible();
});
