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
  TextEditingController password = TextEditingController();
  var loginInformations = LoginResponseModel().obs;

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
      Print.yellow(data.data);
      LoginResponseModel loginData =
          LoginResponseModel.fromJson(data.data as Map<String, dynamic>);
      loginInformations.value = loginData;
      if (loginData.user != null) {
        GetStorage().write(AppStringConstant.user, loginData.user!.toJson());
        GetStorage()
            .write(AppStringConstant.accessToken, loginData.accessToken!);

        loginButtonLoading.value = false;

        Get.offAndToNamed('/');
      }
    } on DioException catch (e) {
      Print.green(e.response);
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
