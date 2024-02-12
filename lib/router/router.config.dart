import 'package:go_router/go_router.dart';
import 'package:local_bands_client/auth/presentation/views/sign-in.view.dart';
import 'package:local_bands_client/shared/session/session.provider.dart';
import 'package:local_bands_client/store/presentation/views/store.view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.config.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final initialLocation = ref.read(sessionProvider.notifier).isAuthenticated
      ? StoreView.route
      : SignInView.route;
  final loggedOutRoutes = [
GoRoute(
        path: SignInView.route,
        builder: (context, state) => const SignInView()),
  ];
  final loggedInRoutes = [
GoRoute(
        path: StoreView.route, builder: (context, state) => const StoreView())
  
  ];
  final routes = [
      ...loggedOutRoutes,
      ...loggedInRoutes
    ];

  

  return GoRouter(routes: routes, initialLocation: initialLocation);
}
