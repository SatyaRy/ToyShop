// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addToCartHash() => r'df89a500c57e1c64e0caa067d418df43b693e38a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [addToCart].
@ProviderFor(addToCart)
const addToCartProvider = AddToCartFamily();

/// See also [addToCart].
class AddToCartFamily extends Family<AsyncValue<void>> {
  /// See also [addToCart].
  const AddToCartFamily();

  /// See also [addToCart].
  AddToCartProvider call(
    CartModel cartDetail,
    String productID,
    int quantity,
  ) {
    return AddToCartProvider(
      cartDetail,
      productID,
      quantity,
    );
  }

  @override
  AddToCartProvider getProviderOverride(
    covariant AddToCartProvider provider,
  ) {
    return call(
      provider.cartDetail,
      provider.productID,
      provider.quantity,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addToCartProvider';
}

/// See also [addToCart].
class AddToCartProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addToCart].
  AddToCartProvider(
    CartModel cartDetail,
    String productID,
    int quantity,
  ) : this._internal(
          (ref) => addToCart(
            ref as AddToCartRef,
            cartDetail,
            productID,
            quantity,
          ),
          from: addToCartProvider,
          name: r'addToCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addToCartHash,
          dependencies: AddToCartFamily._dependencies,
          allTransitiveDependencies: AddToCartFamily._allTransitiveDependencies,
          cartDetail: cartDetail,
          productID: productID,
          quantity: quantity,
        );

  AddToCartProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cartDetail,
    required this.productID,
    required this.quantity,
  }) : super.internal();

  final CartModel cartDetail;
  final String productID;
  final int quantity;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddToCartRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddToCartProvider._internal(
        (ref) => create(ref as AddToCartRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cartDetail: cartDetail,
        productID: productID,
        quantity: quantity,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddToCartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddToCartProvider &&
        other.cartDetail == cartDetail &&
        other.productID == productID &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cartDetail.hashCode);
    hash = _SystemHash.combine(hash, productID.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddToCartRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `cartDetail` of this provider.
  CartModel get cartDetail;

  /// The parameter `productID` of this provider.
  String get productID;

  /// The parameter `quantity` of this provider.
  int get quantity;
}

class _AddToCartProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddToCartRef {
  _AddToCartProviderElement(super.provider);

  @override
  CartModel get cartDetail => (origin as AddToCartProvider).cartDetail;
  @override
  String get productID => (origin as AddToCartProvider).productID;
  @override
  int get quantity => (origin as AddToCartProvider).quantity;
}

String _$getCartItemsHash() => r'755374e099c86642a66830b88000480012d076ea';

/// See also [getCartItems].
@ProviderFor(getCartItems)
final getCartItemsProvider =
    AutoDisposeStreamProvider<List<CartModel>>.internal(
  getCartItems,
  name: r'getCartItemsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCartItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCartItemsRef = AutoDisposeStreamProviderRef<List<CartModel>>;
String _$deleteCartHash() => r'0b51c1dc6f41dab4f1f00a09ec546593e23db859';

/// See also [deleteCart].
@ProviderFor(deleteCart)
const deleteCartProvider = DeleteCartFamily();

/// See also [deleteCart].
class DeleteCartFamily extends Family<AsyncValue<void>> {
  /// See also [deleteCart].
  const DeleteCartFamily();

  /// See also [deleteCart].
  DeleteCartProvider call(
    String cartID,
    dynamic cost,
  ) {
    return DeleteCartProvider(
      cartID,
      cost,
    );
  }

  @override
  DeleteCartProvider getProviderOverride(
    covariant DeleteCartProvider provider,
  ) {
    return call(
      provider.cartID,
      provider.cost,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteCartProvider';
}

/// See also [deleteCart].
class DeleteCartProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteCart].
  DeleteCartProvider(
    String cartID,
    dynamic cost,
  ) : this._internal(
          (ref) => deleteCart(
            ref as DeleteCartRef,
            cartID,
            cost,
          ),
          from: deleteCartProvider,
          name: r'deleteCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteCartHash,
          dependencies: DeleteCartFamily._dependencies,
          allTransitiveDependencies:
              DeleteCartFamily._allTransitiveDependencies,
          cartID: cartID,
          cost: cost,
        );

  DeleteCartProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cartID,
    required this.cost,
  }) : super.internal();

  final String cartID;
  final dynamic cost;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteCartRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteCartProvider._internal(
        (ref) => create(ref as DeleteCartRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cartID: cartID,
        cost: cost,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteCartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteCartProvider &&
        other.cartID == cartID &&
        other.cost == cost;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cartID.hashCode);
    hash = _SystemHash.combine(hash, cost.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteCartRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `cartID` of this provider.
  String get cartID;

  /// The parameter `cost` of this provider.
  dynamic get cost;
}

class _DeleteCartProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteCartRef {
  _DeleteCartProviderElement(super.provider);

  @override
  String get cartID => (origin as DeleteCartProvider).cartID;
  @override
  dynamic get cost => (origin as DeleteCartProvider).cost;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
