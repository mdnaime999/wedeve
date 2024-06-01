import 'dart:convert';

MLogin mLoginFromJson(String str) => MLogin.fromJson(json.decode(str));

String mLoginToJson(MLogin data) => json.encode(data.toJson());

class MLogin {
  final String? accessToken;
  final String? refreshToken;
  final DateTime? expiresAt;

  MLogin({
    this.accessToken,
    this.refreshToken,
    this.expiresAt,
  });

  factory MLogin.fromJson(Map<String, dynamic> json) => MLogin(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        expiresAt: DateTime.parse(json["expiresAt"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiresAt": expiresAt.toString(),
      };
}
