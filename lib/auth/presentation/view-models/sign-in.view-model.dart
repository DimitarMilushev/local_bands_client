import 'package:local_bands_client/auth/application/auth.service.dart';
import 'package:local_bands_client/router/router.config.dart';
import 'package:local_bands_client/store/presentation/views/store.view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign-in.view-model.g.dart';

@riverpod
class SignInViewModel extends _$SignInViewModel { 
  late final AuthService service;
  @override
  FutureOr<void> build() {
    service =  ref.read(authServiceProvider);
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => service.signIn(email, password));
    if (state.hasError) {
      print('Has Error!');
      print(state.error);
      return; 
    }
    ref.read(routerProvider).go(StoreView.route);
  }
}
