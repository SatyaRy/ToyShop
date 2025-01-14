import "package:freezed_annotation/freezed_annotation.dart";
part "auth.freezed.dart";
part "auth.g.dart";

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String uid,
    required String username,
    required String email,
    required String profile,
    required String password,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
