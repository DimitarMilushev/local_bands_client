import 'package:dio/dio.dart';
import 'package:local_bands_client/shared/dio.provider.dart';
import 'package:local_bands_client/store/data/dtos/products.dto.dart';
import 'package:local_bands_client/store/models/product.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products.repository.g.dart';

@riverpod
ProductsRepository productsRepository(ProductsRepositoryRef ref) =>
    ProductsRepository(
        client: ref.read(dioProvider));

class ProductsRepository {
  final Dio client;
  ProductsRepository({required this.client});

  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get('/store/products');
    final products = ProductsDto.fromJson({"products": response.data});
    return products.products;
  }
}
