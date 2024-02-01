import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign-in.dto.freezed.dart';

@freezed
class SignInDto with _$SignInDto {
  const factory SignInDto({required String email, required String password}) =
      _SignInDto;
}
