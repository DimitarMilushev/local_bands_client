import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_bands_client/components/product-card.component.dart';
import 'package:local_bands_client/store/models/product.model.dart';
import 'package:local_bands_client/store/presentation/view-models/products.view-model.dart';

class StoreView extends ConsumerStatefulWidget {
  static const route = '/store';

  const StoreView({super.key});

  @override
  ConsumerState<StoreView> createState() => StoreViewState();
}

class StoreViewState extends ConsumerState<StoreView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(productsViewModelProvider.notifier).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<ProductModel>> productsState =
        ref.watch(productsViewModelProvider);
    return SingleChildScrollView(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ..._paintProductCards(productsState.value),
          if (productsState.isLoading)
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 64),
                child: CircularProgressIndicator()),
          ElevatedButton(
              onPressed:
                  ref.read(productsViewModelProvider.notifier).loadProducts,
              child: const Text('Load more...'))
        ],
      ),
    ));
  }

  List<ProductCard> _paintProductCards(List<ProductModel>? products) {
    if (products == null || products.isEmpty) return [];

    return products
        .map((e) => ProductCard(
            key: Key(e.id.toString()),
            product: e))
        .toList();
  }
}
