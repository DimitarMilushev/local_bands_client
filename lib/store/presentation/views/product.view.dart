import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_bands_client/components/radio-buttons/colored/colored-button-group.component.dart';
import 'package:local_bands_client/router/router.config.dart';
import 'package:local_bands_client/store/models/product-color.model.dart';
import 'package:local_bands_client/store/models/product-labeled-size.model.dart';
import 'package:local_bands_client/store/models/product.model.dart';
import 'package:local_bands_client/store/presentation/view-models/product.view-model.dart';
import 'package:local_bands_client/store/presentation/views/store.view.dart';
// import 'package:local_bands_client/store/models/product.model.dart';

class ProductView extends ConsumerStatefulWidget {
  static const String route = "/product/:id";

  final int productId;
  const ProductView(this.productId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductViewState();
}

final colors = [
  ProductColor(id: 1, hex: Colors.black.hex, label: "Black"),
  ProductColor(id: 2, hex: Colors.yellow.hex, label: "Yellow"),
  ProductColor(id: 3, hex: Colors.pink.hex, label: "Pink"),
  ProductColor(id: 4, hex: Colors.blue.hex, label: "Blue"),
];

class _ProductViewState extends ConsumerState<ProductView> {
  late AsyncValue<ProductModel> data;
  final TextEditingController _quantityController =
      TextEditingController(text: "1");
  ProductColor _selectedColor = colors.first;
  Set<ProductLabeledSize> selected = {};
  @override
  Widget build(BuildContext context) {
    data = ref.watch(productViewModelProviderFamily.call(widget.productId));
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            final router = ref.read(routerProvider);
            router.canPop() ? router.pop() : router.go(StoreView.route);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: data.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.value!.name,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          IconButton.outlined(
                            icon: Icon(Icons.favorite),
                            onPressed: () {},
                          ),
                        ]),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: CarouselSlider.builder(
                          itemCount: data.value!.photos.length,
                          itemBuilder: (context, index, _) =>
                              Image.network(data.value!.photos[index]),
                          options: CarouselOptions()),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${data.value?.price.toStringAsPrecision(3)} лева",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                IconButton.outlined(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_bag),
                                ),
                              ],
                            )),
                        Row(
                          children: [
                            Icon(
                              Icons.visibility,
                              size: 20,
                            ),
                            SizedBox.square(
                              dimension: 8,
                            ),
                            Text(
                              "(${Random().nextInt(2000).toString()} views)",
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                        _LabeledSizesBox(
                            onSelectionChanged: (selection) {
                              setState(() {
                                selected.clear();
                                selected.add(selection.first);
                                print(selection);
                              });
                            },
                            selected: selected),
                        _QuantityBox(controller: _quantityController),
                        _ColorButtons(
                            colors: colors,
                            selected: _selectedColor,
                            onColorSelected: (color) {
                              setState(() {
                                _selectedColor = color;
                              });
                            }),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 32),
                            child: Text(
                              "(${data.value!.description}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ))
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class _ColorButtons extends StatelessWidget {
  final List<ProductColor> colors;
  final ProductColor selected;
  final Function(ProductColor color) onColorSelected;
  const _ColorButtons(
      {required this.colors,
      required this.selected,
      required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    final List<String> hexList = colors.map((c) => c.hex).toList();
    return ColorButtonGroup(
        colors: hexList,
        selectedIndex: hexList.indexOf(selected.hex),
        onColorSelected: (index) => {
              onColorSelected(
                  colors.firstWhere((element) => element.hex == hexList[index]))
            });
  }
}

class _LabeledSizesBox extends StatelessWidget {
  final void Function(Set<dynamic>) onSelectionChanged;
  final Set<ProductLabeledSize> selected;
  const _LabeledSizesBox(
      {super.key, required this.onSelectionChanged, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: SegmentedButton(
            segments: _buildSizes(context),
            selected: selected,
            emptySelectionAllowed: true,
            showSelectedIcon: false,
            onSelectionChanged: (s) => onSelectionChanged(s)));
  }

  List<ButtonSegment> _buildSizes(BuildContext context) {
    final List<ProductLabeledSize> sizes = [
      ProductLabeledSize(id: 1, name: "S", inStock: true),
      ProductLabeledSize(id: 2, name: "M", inStock: false),
      ProductLabeledSize(id: 3, name: "X", inStock: false),
      ProductLabeledSize(id: 4, name: "XL", inStock: true),
      ProductLabeledSize(id: 5, name: "2XL", inStock: true),
      ProductLabeledSize(id: 6, name: "3XL", inStock: true),
    ];
    return sizes
        .map((s) => ButtonSegment(
            value: s,
            enabled: s.inStock,
            label: Text(
              s.name,
              style: Theme.of(context).textTheme.labelMedium,
            )))
        .toList();
  }
}

class _QuantityBox extends StatelessWidget {
  final TextEditingController controller;
  const _QuantityBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 48,
      child: TextField(
        decoration: InputDecoration(
            labelStyle: Theme.of(context).textTheme.labelLarge,
            enabledBorder: const OutlineInputBorder(),
            labelText: "Quantity"),
        controller: controller,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
