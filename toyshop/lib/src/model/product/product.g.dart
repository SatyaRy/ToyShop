// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      productID: json['productID'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      productPrice: json['productPrice'],
      productQuantity: (json['productQuantity'] as num).toInt(),
      timeStamp: json['timeStamp'] as String,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'productPrice': instance.productPrice,
      'productQuantity': instance.productQuantity,
      'timeStamp': instance.timeStamp,
    };

_$ToyTypeModelImpl _$$ToyTypeModelImplFromJson(Map<String, dynamic> json) =>
    _$ToyTypeModelImpl(
      name: json['name'] as String,
      image: json['image'] as String,
      star: (json['star'] as num).toInt(),
      price: json['price'],
    );

Map<String, dynamic> _$$ToyTypeModelImplToJson(_$ToyTypeModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'star': instance.star,
      'price': instance.price,
    };

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      productID: json['productID'] as String,
      productImage: json['productImage'] as String,
      productName: json['productName'] as String,
      productPrice: json['productPrice'],
      productQuantity: (json['productQuantity'] as num).toInt(),
      timeStamp: json['timeStamp'] as String,
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'productImage': instance.productImage,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productQuantity': instance.productQuantity,
      'timeStamp': instance.timeStamp,
    };
