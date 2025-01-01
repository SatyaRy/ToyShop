// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      productID: json['productID'] as String,
      price: json['price'],
      delivery: json['delivery'] as String,
      createAt: json['createAt'] as String,
      createBy: json['createBy'] as String,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'price': instance.price,
      'delivery': instance.delivery,
      'createAt': instance.createAt,
      'createBy': instance.createBy,
    };
