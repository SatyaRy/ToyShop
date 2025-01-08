// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupModelImpl _$$SignupModelImplFromJson(Map<String, dynamic> json) =>
    _$SignupModelImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$$SignupModelImplToJson(_$SignupModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'age': instance.age,
    };
