import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:laraflutter/application/models/user_model.dart';
import 'package:laraflutter/composables/error_handle.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/config/string_constant.dart';
import 'package:print_color/print_color.dart';

class ProfileController extends GetxController {
  var profile = UserModel().obs;
  TextEditingController nameTextEditController = TextEditingController();
  TextEditingController emailTextEditController = TextEditingController();
  TextEditingController phoneTextEditController = TextEditingController();
  TextEditingController countryTextEditController = TextEditingController();
  TextEditingController cityTextEditController = TextEditingController();
  TextEditingController streetTextEditController = TextEditingController();
  var emailVerificationMessage = ''.obs;

  var isProfileEdit = false.obs;
  var loadingEditButton = false.obs;
  var loadingSendVerificationEmailButton = false.obs;
  var isEmailVerified = false.obs;
  List<Map<String, dynamic>> get textFieldDatas {
    return [
      {
        'name': "Name",
        'controller': nameTextEditController,
        'icon': const Icon(Icons.account_circle_outlined)
      },
      {
        'name': "Email",
        'controller': emailTextEditController,
        'icon': const Icon(Icons.email)
      },
      {
        'name': "Phone",
        'controller': phoneTextEditController,
        'icon': const Icon(Icons.phone)
      },
      {
        'name': "Country",
        'controller': countryTextEditController,
        'icon': const Icon(Icons.flag_circle)
      },
      {
        'name': "City",
        'controller': cityTextEditController,
        'icon': const Icon(Icons.location_city_outlined)
      },
      {
        'name': "Street",
        'controller': streetTextEditController,
        'icon': const Icon(Icons.signpost_outlined)
      }
    ];
  }

  indexProfile() async {
    try {
      var res = await ApiConfig(url: 'user').get();
      profile.value = UserModel.fromJson(res.data);
      nameTextEditController.text = profile.value.name!;
      emailTextEditController.text = profile.value.email!;
      phoneTextEditController.text = profile.value.phone!;
      countryTextEditController.text = profile.value.country!;
      cityTextEditController.text = profile.value.city!;
      streetTextEditController.text = profile.value.street!;

      isEmailVerified.value =
          profile.value.emailVerifiedAt == null ? false : true;

      GetStorage().remove(AppStringConstant.emailVerifiedAt);
      GetStorage().write(
          AppStringConstant.emailVerifiedAt,
          profile.value.emailVerifiedAt != null
              ? DateFormat('yyyy-MM-dd – kk:mm')
                  .format(profile.value.emailVerifiedAt!)
              : null);
    } on DioException catch (e) {
      Print.red(e.response);
    }
  }

  handleEditProfile() async {
    if (!isProfileEdit.value) {
      isProfileEdit.value = true;
      return;
    }
    try {
      if (loadingEditButton.value) {
        return;
      }
      loadingEditButton.value = true;
      var response = await ApiConfig(url: 'user/profile').post(data: {
        'name': nameTextEditController.text,
        'email': emailTextEditController.text,
        'phone': phoneTextEditController.text,
        'country': countryTextEditController.text,
        'city': cityTextEditController.text,
        'street': streetTextEditController.text,
      });

      Print.green(response.data);
      Get.snackbar(response.data['message'], '');
      isProfileEdit.value = false;
      loadingEditButton.value = false;
    } on DioException catch (e) {
      Print.red(e.response);
    }
  }

  Future sendEmailVerification() async {
    if (loadingSendVerificationEmailButton.value) {
      return;
    }

    loadingSendVerificationEmailButton.value = true;
    try {
      var response = await ApiConfig(url: 'email/verification-notification')
          .post(data: {});
      emailVerificationMessage.value = response.data['message'].toString();

      loadingSendVerificationEmailButton.value = false;
      Get.reloadAll();
    } on DioException catch (e) {
      Print.green(e.response);
      errorHandle(e.response!.data);
      loadingSendVerificationEmailButton.value = false;
    }
  }

  @override
  void onInit() {
    indexProfile();
    super.onInit();
  }
}
