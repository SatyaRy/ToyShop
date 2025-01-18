import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:toyshop/src/data/profile.dart';
import 'package:toyshop/src/model/auth/auth.dart';

final profileServiceProvider = Provider((ref) {
  return ProfileService();
});

final getUserInfoProvider = FutureProvider<UserModel>((ref) {
  final service = ref.watch(profileServiceProvider);
  return service.getUserDetail();
});

final getAppInfoProvider = FutureProvider<PackageInfo>((ref) {
  final service = ref.watch(profileServiceProvider);
  return service.getAppInfo();
});

typedef InfoParameter = ({String uid, String infoType, String newInfo});
final updateInfoProvider = FutureProvider.family<void,InfoParameter>((ref,argument){
  final service = ref.watch(profileServiceProvider);
  return service.updateProfile(
    argument.uid, 
    argument.infoType, 
    argument.newInfo);
});
