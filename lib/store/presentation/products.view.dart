import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_bands_client/router/router.config.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => StoreViewState();
}

class StoreViewState extends State<StoreView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(onPressed: () => context.go(kSignInURL), child: Text("Go back"),));
  }
}