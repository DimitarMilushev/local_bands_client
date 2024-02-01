import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_bands_client/auth/data/dtos/sign-in.dto.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
}); 

class AuthService {
  AuthService(); 

  Future<void> signIn(String email, String password) {
    final dto = SignInDto(email: email, password: password);

    return Future.delayed(const Duration(seconds: 1), () {
      print(dto);
    });
  }

  Future<void> signOut() {
    throw UnimplementedError();
  }
}
