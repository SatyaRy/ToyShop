// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductHash() => r'dd921b98613d9d6a0d473fe92503f4dca3a4196b';

/// See also [getProduct].
@ProviderFor(getProduct)
final getProductProvider =
    AutoDisposeStreamProvider<List<ProductModel>>.internal(
  getProduct,
  name: r'getProductProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProductRef = AutoDisposeStreamProviderRef<List<ProductModel>>;
String _$getToyTypeHash() => r'7d73771ef29e16aa694a75926c0cd9927c0bc10c';

/// See also [getToyType].
@ProviderFor(getToyType)
final getToyTypeProvider =
    AutoDisposeStreamProvider<List<ToyTypeModel>>.internal(
  getToyType,
  name: r'getToyTypeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getToyTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetToyTypeRef = AutoDisposeStreamProviderRef<List<ToyTypeModel>>;
String _$getTrendingToyHash() => r'd5455821f034074a0fda0c979dbbb272be35de4a';

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

/// See also [getTrendingToy].
@ProviderFor(getTrendingToy)
const getTrendingToyProvider = GetTrendingToyFamily();

/// See also [getTrendingToy].
class GetTrendingToyFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [getTrendingToy].
  const GetTrendingToyFamily();

  /// See also [getTrendingToy].
  GetTrendingToyProvider call(
    String productType,
  ) {
    return GetTrendingToyProvider(
      productType,
    );
  }

  @override
  GetTrendingToyProvider getProviderOverride(
    covariant GetTrendingToyProvider provider,
  ) {
    return call(
      provider.productType,
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
  String? get name => r'getTrendingToyProvider';
}

/// See also [getTrendingToy].
class GetTrendingToyProvider
    extends AutoDisposeStreamProvider<List<ProductModel>> {
  /// See also [getTrendingToy].
  GetTrendingToyProvider(
    String productType,
  ) : this._internal(
          (ref) => getTrendingToy(
            ref as GetTrendingToyRef,
            productType,
          ),
          from: getTrendingToyProvider,
          name: r'getTrendingToyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTrendingToyHash,
          dependencies: GetTrendingToyFamily._dependencies,
          allTransitiveDependencies:
              GetTrendingToyFamily._allTransitiveDependencies,
          productType: productType,
        );

  GetTrendingToyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productType,
  }) : super.internal();

  final String productType;

  @override
  Override overrideWith(
    Stream<List<ProductModel>> Function(GetTrendingToyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTrendingToyProvider._internal(
        (ref) => create(ref as GetTrendingToyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productType: productType,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<ProductModel>> createElement() {
    return _GetTrendingToyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTrendingToyProvider && other.productType == productType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetTrendingToyRef on AutoDisposeStreamProviderRef<List<ProductModel>> {
  /// The parameter `productType` of this provider.
  String get productType;
}

class _GetTrendingToyProviderElement
    extends AutoDisposeStreamProviderElement<List<ProductModel>>
    with GetTrendingToyRef {
  _GetTrendingToyProviderElement(super.provider);

  @override
  String get productType => (origin as GetTrendingToyProvider).productType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
