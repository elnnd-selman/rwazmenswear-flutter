import 'dart:convert';

import 'package:laraflutter/application/models/user_model.dart';

class LoginResponseModel {
  final UserModel? user;
  final String? message;
  final String? accessToken;
  final String? tokenType;
  final DateTime? emailVerifiedAt;

  LoginResponseModel({
    this.user,
    this.message,
    this.accessToken,
    this.tokenType,
    this.emailVerifiedAt,
  });

  LoginResponseModel copyWith({
    UserModel? user,
    String? message,
    String? accessToken,
    String? tokenType,
    DateTime? emailVerifiedAt,
  }) =>
      LoginResponseModel(
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        user: user ?? this.user,
        message: message ?? this.message,
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
      );

  factory LoginResponseModel.fromRawJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        emailVerifiedAt: json["email_verified_at"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "message": message,
        "email_verified_at": emailVerifiedAt,
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
