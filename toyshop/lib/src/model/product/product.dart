import "package:freezed_annotation/freezed_annotation.dart";
part "product.freezed.dart";
part "product.g.dart";

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required String productID,
    required String productName,
    required String productImage,
    required dynamic productPrice,
    required int productQuantity,
    required String timeStamp,
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class ForyouModel with _$ForyouModel {
  factory ForyouModel({
    required String name,
    required String image,
    required int star,
    required dynamic price,
  }) = _ForyouModel;
  factory ForyouModel.fromJson(Map<String, dynamic> json) =>
      _$ForyouModelFromJson(json);
}

@freezed
class CartModel with _$CartModel {
  factory CartModel({
    required String productID,
    required String productImage,
    required String productName,
    required dynamic productPrice,
    required int productQuantity,
    required String timeStamp,
  }) = _CartModel;
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  factory CartModel.fromProductModel(ProductModel productDetail) {
    return CartModel(
        productID: productDetail.productID,
        productImage: productDetail.productImage,
        productName: productDetail.productName,
        productPrice: productDetail.productPrice,
        productQuantity: productDetail.productQuantity,
        timeStamp: productDetail.timeStamp);
  }
}