import 'package:local_bands_client/auth/application/auth.service.dart';
import 'package:local_bands_client/router/router.config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign-in.view-model.g.dart';

@riverpod
class SignInViewModel extends _$SignInViewModel {
  late final AuthService authService;
  @override
  FutureOr<void> build() {
    authService = ref.read(authServiceProvider);
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authService.signIn(email, password));
    ref.read(routerProvider).go(kStoreURL);
  }
}
