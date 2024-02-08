import 'package:flutter/material.dart';
import 'package:local_bands_client/components/product-card.component.dart';
import 'package:local_bands_client/store/models/product.model.dart';

Widget productCard() => const Center(
    child: ProductCard(
        product: ProductModel(
            id: 1,
            title: 'SOME T-ASDASDADASDASDADSDSA',
            price: 20,
            discount: 5,
            photo:
                "https://usstore.megadeth.com/cdn/shop/files/MEGADETH_merchonboard-peacesellstracklistteefront.png")));

Widget productsList() => SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: Column(children: const [
        ProductCard(
            product: ProductModel(
                id: 1,
                title: 'SOME T-SHIRT',
                price: 20,
                discount: 5,
                photo:
                    "https://usstore.megadeth.com/cdn/shop/files/MEGADETH_merchonboard-peacesellstracklistteefront.png")),
        ProductCard(
            product: ProductModel(
                id: 1,
                title: 'SOME T-SHIRT',
                price: 20,
                discount: 5,
                photo:
                    "https://usstore.megadeth.com/cdn/shop/files/MEGADETH_merchonboard-peacesellstracklistteefront.png")),
        ProductCard(
            product: ProductModel(
                id: 1,
                title: 'SOME T-SHIRT',
                price: 20,
                discount: 5,
                photo:
                    "https://usstore.megadeth.com/cdn/shop/files/MEGADETH_merchonboard-peacesellstracklistteefront.png"))
      ],
    ));
