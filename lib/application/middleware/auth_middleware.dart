import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laraflutter/config/string_constant.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Logic to check if the user is logged in.
    // Return null if the user is logged in, else redirect to the login page.
    bool isLoggedIn = checkUserLoggedIn(); // Implement this method
    if (!isLoggedIn) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }

  bool checkUserLoggedIn() {
    if (GetStorage().read(AppStringConstant.user) == null ||
        GetStorage().read(AppStringConstant.accessToken) == null) {
      return false;
    }
    return true; // Return true if logged in, false otherwise
  }
}
