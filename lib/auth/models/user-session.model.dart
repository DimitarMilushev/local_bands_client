import 'package:freezed_annotation/freezed_annotation.dart';

part 'user-session.model.freezed.dart';
part 'user-session.model.g.dart';

@freezed
class UserSessionModel with _$UserSessionModel {
  const factory UserSessionModel({required String email, required String role}) =
      _UserSessionModel;

  factory UserSessionModel.fromJson(Map<String, dynamic> json) => _$UserSessionModelFromJson(json);
}
