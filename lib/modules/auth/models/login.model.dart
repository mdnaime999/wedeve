// To parse this JSON data, do
//
//     final mLogin = mLoginFromJson(jsonString);

import 'dart:convert';

MLogin mLoginFromJson(String str) => MLogin.fromJson(json.decode(str));

String mLoginToJson(MLogin data) => json.encode(data.toJson());

class MLogin {
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  MLogin({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  factory MLogin.fromJson(Map<String, dynamic> json) => MLogin(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
      };
}
