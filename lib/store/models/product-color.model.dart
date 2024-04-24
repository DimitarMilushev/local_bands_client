import 'package:freezed_annotation/freezed_annotation.dart';

part "product-color.model.freezed.dart";
part "product-color.model.g.dart";

@freezed
class ProductColor with _$ProductColor {
  const factory ProductColor(
      {
        required int id,
        required String hex,
        required String label,
      }) = _ProductColor;

  factory ProductColor.fromJson(Map<String, dynamic> json) =>
      _$ProductColorFromJson(json);
}
