import 'package:freezed_annotation/freezed_annotation.dart';

part "product.model.freezed.dart";
part "product.model.g.dart";

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel(
      {required int id,
      required String title,
      required String photo,
      required double price,
      double? discount}) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
