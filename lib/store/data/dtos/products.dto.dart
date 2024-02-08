import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_bands_client/store/models/product.model.dart';

part 'products.dto.freezed.dart';
part 'products.dto.g.dart';

@freezed
class ProductsDto with _$ProductsDto {
  const factory ProductsDto(
      {required List<ProductModel> products}) = _ProductsDto;

  factory ProductsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoFromJson(json);
}
