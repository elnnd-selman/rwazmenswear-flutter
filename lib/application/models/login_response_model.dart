import 'dart:convert';

import 'package:laraflutter/application/models/user_model.dart';

class LoginResponseModel {
  final UserModel? user;
  final String? message;
  final String? accessToken;
  final String? tokenType;
  final dynamic emailVerified;

  LoginResponseModel({
    this.user,
    this.message,
    this.accessToken,
    this.tokenType,
    this.emailVerified,
  });

  LoginResponseModel copyWith({
    UserModel? user,
    String? message,
    String? accessToken,
    String? tokenType,
    String? emailVerified,
  }) =>
      LoginResponseModel(
        emailVerified: emailVerified ?? this.emailVerified,
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
        emailVerified: json["email_verified"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "message": message,
        "email_verified": emailVerified,
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
