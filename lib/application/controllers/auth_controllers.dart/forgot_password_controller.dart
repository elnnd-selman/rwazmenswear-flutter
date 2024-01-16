import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laraflutter/application/models/login_response_model.dart';
import 'package:laraflutter/composables/error_handle.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/config/string_constant.dart';
import 'package:print_color/print_color.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();

  var validationErrors = {}.obs;
  var visiblePassword = true.obs;
  var sendEmailButtonLoading = false.obs;

  Future handleSendEmail() async {
    if (sendEmailButtonLoading.value) {
      return;
    }

    sendEmailButtonLoading.value = true;
    try {
      var response = await ApiConfig(url: 'forgot-password').post(data: {
        'email': email.text,
      });

      Print.green(response.data);
    } on DioException catch (e) {
      Print.green(e.response);
      var error = errorHandle(e.response!.data);
      if (error != null) validationErrors.value = error as Map;
      sendEmailButtonLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
