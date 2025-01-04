// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      productID: json['productID'] as String,
      cost: (json['cost'] as num).toDouble(),
      delivery: json['delivery'] as String,
      createAt: json['createAt'] as String,
      createBy: json['createBy'] as String,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'cost': instance.cost,
      'delivery': instance.delivery,
      'createAt': instance.createAt,
      'createBy': instance.createBy,
    };
