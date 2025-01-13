// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      productID: json['productID'] as String,
      timeStamp: json['timeStamp'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productQuantity: (json['productQuantity'] as num).toInt(),
      productRate: json['productRate'],
      productDetail: json['productDetail'] as String,
      productType: json['productType'] as String,
      productStatus: json['productStatus'] as String,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'timeStamp': instance.timeStamp,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'productPrice': instance.productPrice,
      'productQuantity': instance.productQuantity,
      'productRate': instance.productRate,
      'productDetail': instance.productDetail,
      'productType': instance.productType,
      'productStatus': instance.productStatus,
    };

_$ToyTypeModelImpl _$$ToyTypeModelImplFromJson(Map<String, dynamic> json) =>
    _$ToyTypeModelImpl(
      name: json['name'] as String,
      image: json['image'] as String,
      star: json['star'],
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
      timeStamp: json['timeStamp'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productQuantity: (json['productQuantity'] as num).toInt(),
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'timeStamp': instance.timeStamp,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'productPrice': instance.productPrice,
      'productQuantity': instance.productQuantity,
    };

_$FavoriteModelImpl _$$FavoriteModelImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteModelImpl(
      productID: json['productID'] as String,
      productImage: json['productImage'] as String,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'productImage': instance.productImage,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
    };
