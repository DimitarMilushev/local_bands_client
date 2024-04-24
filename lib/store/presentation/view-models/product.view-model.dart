import 'package:local_bands_client/store/data/products.repository.dart';
import 'package:local_bands_client/store/models/product.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product.view-model.g.dart';

@riverpod
class ProductViewModel extends _$ProductViewModel {
  late final ProductsRepository _repository;

  @override
  FutureOr<ProductModel> build(int id) {
    _repository = ref.read(productsRepositoryProvider);
    
    return _repository.getProductById(id);
  }
}