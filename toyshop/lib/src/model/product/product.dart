import "package:freezed_annotation/freezed_annotation.dart";
part "product.freezed.dart";
part "product.g.dart";

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required String productID,
    required String timeStamp,
    required String productName,
    required String productImage,
    required double productPrice,
    required int productQuantity,
    required dynamic productRate,
    required String productDetail,
    required String productType,
    required String productStatus,
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class ToyTypeModel with _$ToyTypeModel {
  factory ToyTypeModel({
    required String name,
    required String image,
    required dynamic star,
    required dynamic price,
  }) = _ToyTypeModel;
  factory ToyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ToyTypeModelFromJson(json);
}

@freezed
class CartModel with _$CartModel {
  factory CartModel({
    required String productID,
    required String timeStamp,
    required String productName,
    required String productImage,
    required double productPrice,
    required int productQuantity,
  }) = _CartModel;
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  factory CartModel.fromProductModel(ProductModel product) {
    return CartModel(
        productID: product.productID,
        productImage: product.productImage,
        productName: product.productName,
        productPrice: product.productPrice,
        productQuantity: product.productQuantity,
        timeStamp: product.timeStamp,

    );
  }
}