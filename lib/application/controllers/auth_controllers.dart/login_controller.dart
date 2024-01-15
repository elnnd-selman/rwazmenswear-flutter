import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraflutter/composables/error_handle.dart';
import 'package:laraflutter/config/api.dart';
import 'package:print_color/print_color.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var validationErrors = {}.obs;
  var visiblePassword = true.obs;
  var loginButtonLoading = false.obs;

  Future handleLogin() async {
    if (loginButtonLoading.value) {
      return;
    }

    loginButtonLoading.value = true;
    try {
      var data = await ApiConfig(url: 'login')
          .post(data: {'email': email.text, 'password': password.text});
      loginButtonLoading.value = false;
      Print.green(data);
    } on DioException catch (e) {
      var error = errorHandle(e.response!.data);
      if (error != null) validationErrors.value = error as Map;
      loginButtonLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
