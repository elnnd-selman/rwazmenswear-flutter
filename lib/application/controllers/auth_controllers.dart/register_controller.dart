import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laraflutter/application/models/login_response_model.dart';
import 'package:laraflutter/application/models/user_model.dart';
import 'package:laraflutter/composables/error_handle.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/config/string_constant.dart';
import 'package:print_color/print_color.dart';

class RegisterController extends GetxController {
  var profile = UserModel().obs;
  TextEditingController nameTextEditController = TextEditingController();
  TextEditingController emailTextEditController = TextEditingController();
  TextEditingController phoneTextEditController = TextEditingController();
  TextEditingController countryTextEditController = TextEditingController();
  TextEditingController cityTextEditController = TextEditingController();
  TextEditingController streetTextEditController = TextEditingController();
  TextEditingController passwordTextEditController = TextEditingController();
  TextEditingController passwordConfirmationTextEditController =
      TextEditingController();

  var loginInformations = LoginResponseModel().obs;

  var validationErrors = {}.obs;
  var visiblePassword = true.obs;

  var emailVerificationMessage = ''.obs;

  var loadingRegisterButton = false.obs;
  List<Map<String, dynamic>> get textFieldDatas {
    return [
      {
        'key':"name",
        'name': "Name",
        'controller': nameTextEditController,
        'icon': const Icon(Icons.account_circle_outlined)
      },
      {
        'key':"email",
        'name': "Email",
        'controller': emailTextEditController,
        'icon': const Icon(Icons.email)
      },
      {
        'key':"phone",
        'name': "Phone",
        'controller': phoneTextEditController,
        'icon': const Icon(Icons.phone)
      },
      {
        'key':"country",
        'name': "Country",
        'controller': countryTextEditController,
        'icon': const Icon(Icons.flag_circle)
      },
      {
        'key':"city",
        'name': "City",
        'controller': cityTextEditController,
        'icon': const Icon(Icons.location_city_outlined)
      },
      {
        'key':"street",
        'name': "Street",
        'controller': streetTextEditController,
        'icon': const Icon(Icons.signpost_outlined)
      },
      {
        'key':"password",
        'name': "Password",
        'controller': passwordTextEditController,
        'icon': const Icon(Icons.password_outlined)
      },
      {
        'key':"password_confirmation",
        'name': "Verified Password",
        'controller': passwordConfirmationTextEditController,
        'icon': const Icon(Icons.password_outlined)
      }
    ];
  }

  handleRegister() async {
    try {
      if (loadingRegisterButton.value) {
        return;
      }
      loadingRegisterButton.value = true;
      var response = await ApiConfig(url: 'register').post(data: {
        'name': nameTextEditController.text,
        'email': emailTextEditController.text,
        'phone': '000000000000',
        'country': countryTextEditController.text,
        'city': cityTextEditController.text,
        'street': streetTextEditController.text,
        'password': passwordTextEditController.text,
        'password_confirmation': passwordConfirmationTextEditController.text
      });
      Print.green(response.data);
      LoginResponseModel loginData =
          LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
      loginInformations.value = loginData;
      if (loginData.user != null) {
        GetStorage().write(AppStringConstant.user, loginData.user!.toJson());
        GetStorage()
            .write(AppStringConstant.accessToken, loginData.accessToken!);
        GetStorage()
            .write(AppStringConstant.accessToken, loginData.accessToken!);
        loadingRegisterButton.value = false;

        Get.offAndToNamed('/');
        Get.snackbar(response.data['message'], '');
        loadingRegisterButton.value = false;
      }
    } on DioException catch (e) {

       Print.green(e.response);
      var error = errorHandle(e.response!.data);
      
      if (error != null) validationErrors.value = error as Map;
      loadingRegisterButton.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
