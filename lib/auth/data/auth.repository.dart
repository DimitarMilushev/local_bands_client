import 'package:dio/dio.dart';
import 'package:local_bands_client/auth/data/dtos/sign-in.dto.dart';
import 'package:local_bands_client/auth/models/user-session.model.dart';
import 'package:local_bands_client/shared/dio.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "auth.repository.g.dart";

@Riverpod()
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository(
      client: ref.read(dioProvider),
    );

class AuthRepository {
  final Dio client;
  AuthRepository({required this.client});

  Future<UserSessionModel> signIn(String email, String password) async {
    final signInDto = SignInDto(email: email, password: password);
    final response = await client.post('/api/auth/sign-in', data: signInDto.toJson());
    return UserSessionModel.fromJson(response.data);
  }

  Future<void> signOut() => client.get('/api/auth/sign-out');
}
