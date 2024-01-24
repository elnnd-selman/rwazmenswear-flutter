import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraflutter/composables/error_handle.dart';
import 'package:laraflutter/config/api.dart';
import 'package:print_color/print_color.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController email = TextEditingController();

  var message = ''.obs;
  var validationErrors = {}.obs;
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

      message.value = response.data['message'].toString();
      sendEmailButtonLoading.value = false;
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
