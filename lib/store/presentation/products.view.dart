import 'package:flutter/material.dart';

class StoreView extends StatefulWidget {
  static const route = '/store';

  const StoreView({super.key});

  @override
  State<StoreView> createState() => StoreViewState();
}

class StoreViewState extends State<StoreView> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Column(children: []));
  }
}
