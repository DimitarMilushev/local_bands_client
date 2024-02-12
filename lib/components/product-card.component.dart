import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:local_bands_client/store/models/product.model.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final void Function()? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  State<ProductCard> createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  late final double actualPrice;
  late final double? oldPrice;
  late final List<Uint8List> decodedPhotos;

  @override
  void initState() {
    super.initState();
    if (widget.product.discount != null) {
      actualPrice = widget.product.discount!;
      oldPrice = widget.product.price;
    } else {
      actualPrice = widget.product.price;
      oldPrice = null;
    }

    decodedPhotos =
        widget.product.photos.map((photo) => base64Decode(photo)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxHeight: 400, maxWidth: 300),
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: GestureDetector(
            onTap: widget.onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.memory(decodedPhotos.first,
                          alignment: Alignment.bottomCenter, fit: BoxFit.cover),
                      Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: IconButton(
                              icon: const Icon(Icons.add_shopping_cart_rounded),
                              onPressed: () {},
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(widget.product.name,
                              style: Theme.of(context).textTheme.titleLarge)),
                      Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Row(
                            children: [
                              Text('$actualPrice €',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  softWrap: false,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange)),
                              if (oldPrice != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('$oldPrice €',
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      softWrap: false,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough)),
                                ),
                            ],
                          )),
                    ]),
              ],
            )));
  }
}
