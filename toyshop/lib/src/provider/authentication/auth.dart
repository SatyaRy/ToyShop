import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/authentication.dart';

//access auth service
final authenticationProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService();
});

final userProvider = StreamProvider<User?>((ref) {
  final service = ref.watch(authenticationProvider);
  return service.authStateChange;
});
