import 'package:local_bands_client/store/data/products.repository.dart';
import 'package:local_bands_client/store/models/product.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products.view-model.g.dart';

@riverpod
class ProductsViewModel extends _$ProductsViewModel {
  @override
  FutureOr<List<ProductModel>> build() {
    return [];
  }

  Future<void> loadProducts() async {
    final repository = ref.read(productsRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final newProducts = await repository.getAllProducts();
      return [..._state, ...newProducts];
    });
  }

  List<ProductModel> get _state => state.valueOrNull ?? [];
}