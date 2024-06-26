import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_bands_client/auth/presentation/views/sign-in.view.dart';
import 'package:local_bands_client/router/router.config.dart';
import 'package:local_bands_client/shared/session/session.provider.dart';
import 'package:local_bands_client/store/presentation/views/store.view.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState {
  // MyAppRouterDelegate delegate;
  // MyAppRouterInformationParser informationParser;
  // @override
  // void initState() {
  //   delegate = MyAppRouterDelegate(authRepository, colorsRepository);
  //   informationParser = MyAppRouteInformationParser();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 196, 137, 115)),
          useMaterial3: true,
        ),
        routerConfig: ref.watch(routerProvider),
        builder: (context, child) => ref.watch(sessionProvider).value != null
            ? _loggedInView(child)
            : _loggedOutView(child));
  }

  Widget _loggedOutView(Widget? child) {
    return Scaffold(
      body: child,
    );
  }

  Widget _loggedInView(Widget? child) {
    return Overlay(initialEntries: [
      OverlayEntry(
          builder: (context) => Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.radio),
                  shape: CircleBorder(),
                ),
                extendBody: true,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                appBar: ref.watch(sessionProvider.notifier).isAuthenticated
                    ? AppBar()
                    : null,
                body: child,
                bottomNavigationBar: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  color: Colors.cyan.shade400,
                  notchMargin: 5,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.shop,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          ref.read(routerProvider).go(StoreView.route);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          ref.read(routerProvider).go(SignInView.route);
                        },
                      ),
                    ],
                  ),
                ),
              ))
    ]);
  }
}
// class MyAppRouterDelegate extends RouterDelegate {
//   @override
//   void addListener(VoidCallback listener) {
//     // TODO: implement addListener
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> popRoute() {
//     // TODO: implement popRoute
//     throw UnimplementedError();
//   }

//   @override
//   void removeListener(VoidCallback listener) {
//     // TODO: implement removeListener
//   }

//   @override
//   Future<void> setNewRoutePath(configuration) {
//     // TODO: implement setNewRoutePath
//     throw UnimplementedError();
//   }

// }


// class MyAppRouterInformationParser extends RouteInformationParser<MyAppConfiguration> {
//   @override
//   Future<MyAppConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
//     if (routeInformation.uri.pathSegments.isEmpty) {
//       return MyAppConfiguration.home();
//     } else if (routeInformation.uri.pathSegments.length == 1) {
//       final first = routeInformation.uri.pathSegments[0].toLowerCase();
//       if (first == 'home') {
//         return MyAppConfiguration.home();
//       } else if (first == 'login') {
//         return MyAppConfiguration.login();
//       } else {
//         return MyAppConfiguration.unknown();
//       }
//     } else {
//       return MyAppConfiguration.unknown();
//     }
//   }

//   @override
//   RouteInformation? restoreRouteInformation(MyAppConfiguration configuration) {
//      if (configuration.isLoginPage) {
//       return RouteInformation(uri: Uri.parse(SignInView.route));
//     } else if (configuration.isHomePage) {
//       return RouteInformation(uri: Uri.parse(StoreView.route));
//     }

//       return null;
    
//   }
// }


// class MyAppConfiguration {
//   final bool? unknown;
//   final bool? loggedIn;

//   MyAppConfiguration.splash()
//       : unknown = false,
//         loggedIn = null;

//   MyAppConfiguration.login()
//       : unknown = false,
//         loggedIn = false;


//   MyAppConfiguration.home()
//       : unknown = false,
//         loggedIn = true;

//   MyAppConfiguration.unknown()
//       : unknown = true,
//         loggedIn = null;

//   bool get isUnknown => unknown == true;
//   bool get isHomePage => unknown == false && loggedIn == true;
//   bool get isLoginPage =>  unknown == false && loggedIn == false;
//   bool get isSplashPage =>  unknown == false && loggedIn == null;
// }