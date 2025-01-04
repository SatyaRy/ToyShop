import "package:freezed_annotation/freezed_annotation.dart";
part "transaction.g.dart";
part "transaction.freezed.dart";

@freezed
class TransactionModel with _$TransactionModel {
  factory TransactionModel({
    required String productID,
    required double cost,
    required String delivery,
    required String createAt,
    required String createBy,
  }) = _TransactionModel;
  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
