import 'package:flutter/foundation.dart';
import "package:freezed_annotation/freezed_annotation.dart";
part "signup.g.dart";
part "signup.freezed.dart";

@freezed
class SignupModel with _$SignupModel {
  factory SignupModel({
    required String username,
    required String password,
    required int age,
  }) = _SignupModel;
  factory SignupModel.fromJson(Map<String, dynamic> json) =>
      _$SignupModelFromJson(json);
}
