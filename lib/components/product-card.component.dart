// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:local_bands_client/store/models/product.model.dart';

// class ProductCard extends StatefulWidget {
//   final ProductModel product;
//   final void Function()? onTap;

//   const ProductCard({super.key, required this.product, this.onTap});

//   @override
//   State<ProductCard> createState() => ProductCardState();
// }

// class ProductCardState extends State<ProductCard> {
//   late final double actualPrice;
//   late final double? oldPrice;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.product.discount != null) {
//       actualPrice = widget.product.discount!;
//       oldPrice = widget.product.price;
//     } else {
//       actualPrice = widget.product.price;
//       oldPrice = null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         constraints: const BoxConstraints(maxHeight: 400, maxWidth: 300),
//         child: GestureDetector(
//             onTap: widget.onTap,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Stack(
//                     children: [
//                       Image.network(widget.product.photos.first,
//                           alignment: Alignment.bottomCenter, fit: BoxFit.cover),
//                       Align(
//                           alignment: AlignmentDirectional.topEnd,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                                 border:
//                                     Border.all(color: Colors.black, width: 2)),
//                             child: IconButton(
//                               icon: widget.product.isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline_outlined),
//                               onPressed: () {},
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                           child: Text(widget.product.name,
//                               style: Theme.of(context).textTheme.titleLarge)),
//                       Padding(
//                           padding: const EdgeInsets.only(left: 24),
//                           child: Row(
//                             children: [
//                               Text('$actualPrice €',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.clip,
//                                   softWrap: false,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleLarge
//                                       ?.copyWith(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.orange)),
//                               if (oldPrice != null)
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8.0),
//                                   child: Text('$oldPrice €',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.clip,
//                                       softWrap: false,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleSmall
//                                           ?.copyWith(
//                                               decoration:
//                                                   TextDecoration.lineThrough)),
//                                 ),
//                             ],
//                           )),
//                     ]),
//               ],
//             )));
//   }
// }

// class ProductCardHeader extends StatelessWidget {
//   const ProductCardHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:local_bands_client/store/models/product.model.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final void Function()? onTap;
  const ProductCard({super.key, required this.product, this.onTap});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(const Size(168, 246)),
        child: Card(
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              _ProductThumbnail(imageLink: widget.product.photos.first),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  child: Stack(
                    children: [
                      ListTile(
                          contentPadding: EdgeInsets.all(6),
                          title: Text(widget.product.name),
                          subtitle: _ProductSubtitle(
                            price: widget.product.price,
                            discount: widget.product.discount,
                            rating: 4.9,
                            reviewsCount: Random().nextInt(50),
                          )),
                      Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: _ProductFavoriteIcon(
                            isFavorite: widget.product.isFavorite,
                          ))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductThumbnail extends StatelessWidget {
  final String imageLink;
  const _ProductThumbnail({super.key, required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              imageLink,
              fit: BoxFit.fill,
            )));
  }
}

class _ProductFavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final void Function()? onTap;
  const _ProductFavoriteIcon({super.key, this.onTap, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isFavorite
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_outline_outlined),
      onPressed: onTap,
    );
  }
}

class _ProductSubtitle extends StatelessWidget {
  final num price;
  final num rating;
  final int reviewsCount;
  final num? discount;
  const _ProductSubtitle(
      {required this.price,
      required this.rating,
      required this.reviewsCount,
      this.discount});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        '${price.toStringAsPrecision(3)} лева',
        style: TextStyle(color: Colors.black87),
      ),
      Row(children: [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 16,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          rating.toStringAsPrecision(2),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          "($reviewsCount Reviews)",
          style: TextStyle(color: Colors.black45, fontSize: 12),
        )
      ])
    ]);
  }
}
