import 'package:freezed_annotation/freezed_annotation.dart';

part "product-labeled-size.model.freezed.dart";
part "product-labeled-size.model.g.dart";

@freezed
class ProductLabeledSize with _$ProductLabeledSize {
  const factory ProductLabeledSize(
      {required int id,
      required String name,
      required bool inStock,
      }) = _ProductLabeledSize;

  factory ProductLabeledSize.fromJson(Map<String, dynamic> json) =>
      _$ProductLabeledSizeFromJson(json);
}
