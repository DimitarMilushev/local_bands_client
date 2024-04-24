import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_bands_client/components/product-card.component.dart';
import 'package:local_bands_client/router/router.config.dart';
import 'package:local_bands_client/store/models/product.model.dart';
import 'package:local_bands_client/store/presentation/view-models/products.view-model.dart';
import 'package:local_bands_client/store/presentation/views/product.view.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
            width: double.infinity,
            child: Column(children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                  child: SearchBar(
                    hintText: "Looking for something?",
                    trailing: [
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: null,
                      )
                    ],
                  )),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  ..._paintProductCards(productsState.value),
                ],
              ),
              if (productsState.isLoading)
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 64),
                    child: CircularProgressIndicator()),
              ElevatedButton(
                  onPressed:
                      ref.read(productsViewModelProvider.notifier).loadProducts,
                  child: const Text('Load more...')),
              const SizedBox.square(dimension: 120),
            ])));
  }

  List<ProductCard> _paintProductCards(List<ProductModel>? products) {
    if (products == null || products.isEmpty) return [];

    return products
        .map((e) => ProductCard(
              product: e,
              onTap: () {
                ref.read(routerProvider).go(ProductView.route
                    .replaceAll(RegExp(":id"), e.id.toString()));
              },
            ))
        .toList();
  }
}
