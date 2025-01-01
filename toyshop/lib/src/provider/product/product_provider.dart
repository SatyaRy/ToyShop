import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/data/product.dart';
import 'package:toyshop/src/model/product/product.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
part "product_provider.g.dart";


@riverpod 
Stream<List<ProductModel>> getProduct(Ref ref) {
    return ProductService().getProduct();
  }
@riverpod
Stream<List<ForyouModel>> getForyou(Ref ref) {
    return ProductService().getForyou();
  }