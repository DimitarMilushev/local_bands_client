import 'package:flutter/foundation.dart';
import 'package:local_bands_client/auth/models/user-session.model.dart';
import 'package:local_bands_client/shared/cookie-manager.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "session.provider.g.dart";

@Riverpod(keepAlive: true)
class Session extends _$Session {
  @override
  FutureOr<UserSessionModel?> build() {
    return null; // SHOULD LOAD SESSION DATA
  }

  bool get isAuthenticated => state.value != null; 

  Future<void> begin(UserSessionModel sessionData) async {
    state = AsyncValue.data(sessionData);
  }

  Future<void> end() async {
    state = const AsyncLoading();
    if (!kIsWeb) await ref.read(cookieManagerProvider).cookieJar.deleteAll(); 
    state = const AsyncValue.data(null);
  }
}