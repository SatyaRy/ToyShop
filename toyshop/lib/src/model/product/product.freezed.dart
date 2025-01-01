// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get productID => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productImage => throw _privateConstructorUsedError;
  dynamic get productPrice => throw _privateConstructorUsedError;
  int get productQuantity => throw _privateConstructorUsedError;
  String get timeStamp => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String productID,
      String productName,
      String productImage,
      dynamic productPrice,
      int productQuantity,
      String timeStamp});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? productName = null,
    Object? productImage = null,
    Object? productPrice = freezed,
    Object? productQuantity = null,
    Object? timeStamp = null,
  }) {
    return _then(_value.copyWith(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: freezed == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productQuantity: null == productQuantity
          ? _value.productQuantity
          : productQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productID,
      String productName,
      String productImage,
      dynamic productPrice,
      int productQuantity,
      String timeStamp});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? productName = null,
    Object? productImage = null,
    Object? productPrice = freezed,
    Object? productQuantity = null,
    Object? timeStamp = null,
  }) {
    return _then(_$ProductModelImpl(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: freezed == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productQuantity: null == productQuantity
          ? _value.productQuantity
          : productQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  _$ProductModelImpl(
      {required this.productID,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productQuantity,
      required this.timeStamp});

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String productID;
  @override
  final String productName;
  @override
  final String productImage;
  @override
  final dynamic productPrice;
  @override
  final int productQuantity;
  @override
  final String timeStamp;

  @override
  String toString() {
    return 'ProductModel(productID: $productID, productName: $productName, productImage: $productImage, productPrice: $productPrice, productQuantity: $productQuantity, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            const DeepCollectionEquality()
                .equals(other.productPrice, productPrice) &&
            (identical(other.productQuantity, productQuantity) ||
                other.productQuantity == productQuantity) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productID,
      productName,
      productImage,
      const DeepCollectionEquality().hash(productPrice),
      productQuantity,
      timeStamp);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {required final String productID,
      required final String productName,
      required final String productImage,
      required final dynamic productPrice,
      required final int productQuantity,
      required final String timeStamp}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get productID;
  @override
  String get productName;
  @override
  String get productImage;
  @override
  dynamic get productPrice;
  @override
  int get productQuantity;
  @override
  String get timeStamp;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForyouModel _$ForyouModelFromJson(Map<String, dynamic> json) {
  return _ForyouModel.fromJson(json);
}

/// @nodoc
mixin _$ForyouModel {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get star => throw _privateConstructorUsedError;
  dynamic get price => throw _privateConstructorUsedError;

  /// Serializes this ForyouModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForyouModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForyouModelCopyWith<ForyouModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForyouModelCopyWith<$Res> {
  factory $ForyouModelCopyWith(
          ForyouModel value, $Res Function(ForyouModel) then) =
      _$ForyouModelCopyWithImpl<$Res, ForyouModel>;
  @useResult
  $Res call({String name, String image, int star, dynamic price});
}

/// @nodoc
class _$ForyouModelCopyWithImpl<$Res, $Val extends ForyouModel>
    implements $ForyouModelCopyWith<$Res> {
  _$ForyouModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForyouModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? star = null,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForyouModelImplCopyWith<$Res>
    implements $ForyouModelCopyWith<$Res> {
  factory _$$ForyouModelImplCopyWith(
          _$ForyouModelImpl value, $Res Function(_$ForyouModelImpl) then) =
      __$$ForyouModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String image, int star, dynamic price});
}

/// @nodoc
class __$$ForyouModelImplCopyWithImpl<$Res>
    extends _$ForyouModelCopyWithImpl<$Res, _$ForyouModelImpl>
    implements _$$ForyouModelImplCopyWith<$Res> {
  __$$ForyouModelImplCopyWithImpl(
      _$ForyouModelImpl _value, $Res Function(_$ForyouModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForyouModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? star = null,
    Object? price = freezed,
  }) {
    return _then(_$ForyouModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      star: null == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForyouModelImpl implements _ForyouModel {
  _$ForyouModelImpl(
      {required this.name,
      required this.image,
      required this.star,
      required this.price});

  factory _$ForyouModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForyouModelImplFromJson(json);

  @override
  final String name;
  @override
  final String image;
  @override
  final int star;
  @override
  final dynamic price;

  @override
  String toString() {
    return 'ForyouModel(name: $name, image: $image, star: $star, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForyouModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.star, star) || other.star == star) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, image, star,
      const DeepCollectionEquality().hash(price));

  /// Create a copy of ForyouModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForyouModelImplCopyWith<_$ForyouModelImpl> get copyWith =>
      __$$ForyouModelImplCopyWithImpl<_$ForyouModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForyouModelImplToJson(
      this,
    );
  }
}

abstract class _ForyouModel implements ForyouModel {
  factory _ForyouModel(
      {required final String name,
      required final String image,
      required final int star,
      required final dynamic price}) = _$ForyouModelImpl;

  factory _ForyouModel.fromJson(Map<String, dynamic> json) =
      _$ForyouModelImpl.fromJson;

  @override
  String get name;
  @override
  String get image;
  @override
  int get star;
  @override
  dynamic get price;

  /// Create a copy of ForyouModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForyouModelImplCopyWith<_$ForyouModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return _CartModel.fromJson(json);
}

/// @nodoc
mixin _$CartModel {
  String get productID => throw _privateConstructorUsedError;
  String get productImage => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  dynamic get productPrice => throw _privateConstructorUsedError;
  int get productQuantity => throw _privateConstructorUsedError;
  String get timeStamp => throw _privateConstructorUsedError;

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call(
      {String productID,
      String productImage,
      String productName,
      dynamic productPrice,
      int productQuantity,
      String timeStamp});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? productImage = null,
    Object? productName = null,
    Object? productPrice = freezed,
    Object? productQuantity = null,
    Object? timeStamp = null,
  }) {
    return _then(_value.copyWith(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: freezed == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productQuantity: null == productQuantity
          ? _value.productQuantity
          : productQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartModelImplCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$$CartModelImplCopyWith(
          _$CartModelImpl value, $Res Function(_$CartModelImpl) then) =
      __$$CartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productID,
      String productImage,
      String productName,
      dynamic productPrice,
      int productQuantity,
      String timeStamp});
}

/// @nodoc
class __$$CartModelImplCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$CartModelImpl>
    implements _$$CartModelImplCopyWith<$Res> {
  __$$CartModelImplCopyWithImpl(
      _$CartModelImpl _value, $Res Function(_$CartModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? productImage = null,
    Object? productName = null,
    Object? productPrice = freezed,
    Object? productQuantity = null,
    Object? timeStamp = null,
  }) {
    return _then(_$CartModelImpl(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: freezed == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productQuantity: null == productQuantity
          ? _value.productQuantity
          : productQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartModelImpl implements _CartModel {
  _$CartModelImpl(
      {required this.productID,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.timeStamp});

  factory _$CartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartModelImplFromJson(json);

  @override
  final String productID;
  @override
  final String productImage;
  @override
  final String productName;
  @override
  final dynamic productPrice;
  @override
  final int productQuantity;
  @override
  final String timeStamp;

  @override
  String toString() {
    return 'CartModel(productID: $productID, productImage: $productImage, productName: $productName, productPrice: $productPrice, productQuantity: $productQuantity, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartModelImpl &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            const DeepCollectionEquality()
                .equals(other.productPrice, productPrice) &&
            (identical(other.productQuantity, productQuantity) ||
                other.productQuantity == productQuantity) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productID,
      productImage,
      productName,
      const DeepCollectionEquality().hash(productPrice),
      productQuantity,
      timeStamp);

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      __$$CartModelImplCopyWithImpl<_$CartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartModelImplToJson(
      this,
    );
  }
}

abstract class _CartModel implements CartModel {
  factory _CartModel(
      {required final String productID,
      required final String productImage,
      required final String productName,
      required final dynamic productPrice,
      required final int productQuantity,
      required final String timeStamp}) = _$CartModelImpl;

  factory _CartModel.fromJson(Map<String, dynamic> json) =
      _$CartModelImpl.fromJson;

  @override
  String get productID;
  @override
  String get productImage;
  @override
  String get productName;
  @override
  dynamic get productPrice;
  @override
  int get productQuantity;
  @override
  String get timeStamp;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
