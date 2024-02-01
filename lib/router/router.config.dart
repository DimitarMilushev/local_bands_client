import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_bands_client/auth/presentation/views/sign-in.view.dart';
import 'package:local_bands_client/store/presentation/products.view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.config.g.dart';

@riverpod
GoRouter router(RouterRef ref) => GoRouter(routes: [
      GoRoute(
          path: kSignInURL,
          builder: (context, state) => _build(const SignInView())),
      GoRoute(
          path: kStoreURL,
          builder: (context, state) => _build(const StoreView()))
    ], initialLocation: kSignInURL);

Widget _build(Widget child) => Scaffold(body: child);

const kSignInURL = '/sign-in';
const kStoreURL = '/store';
