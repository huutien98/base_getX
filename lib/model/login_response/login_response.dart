import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? accessToken;
  final String? refreshToken;

  const LoginResponse(this.accessToken, this.refreshToken);

  factory LoginResponse.empty() {
    return const LoginResponse(null, null);
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
