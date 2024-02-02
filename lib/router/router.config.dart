import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:local_bands_client/auth/presentation/views/sign-in.view.dart';
import 'package:local_bands_client/store/presentation/products.view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.config.g.dart';

@riverpod
GoRouter router(RouterRef ref) => GoRouter(routes: [
      GoRoute(
          path: SignInView.route,
          builder: (context, state) => _build(const SignInView(), ref)),
      GoRoute(
          path: StoreView.route,
          builder: (context, state) => _build(const StoreView(), ref))
    ], initialLocation: SignInView.route);

Widget _build(Widget child, Ref ref) => Scaffold(
    body: child);
