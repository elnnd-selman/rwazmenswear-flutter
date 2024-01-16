import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/models/user_model.dart';
import 'package:laraflutter/config/api.dart';
import 'package:print_color/print_color.dart';

class ProfileController extends GetxController {
  var profile = UserModel().obs;
  TextEditingController nameTextEditController = TextEditingController();
  TextEditingController emailTextEditController = TextEditingController();
  TextEditingController phoneTextEditController = TextEditingController();
  TextEditingController countryTextEditController = TextEditingController();
  TextEditingController cityTextEditController = TextEditingController();
  TextEditingController streetTextEditController = TextEditingController();

  var isProfileEdit = false.obs;
  var loadingEditButton = false.obs;
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
      Get.snackbar(response.data['message'], '');
      isProfileEdit.value = false;
      loadingEditButton.value = false;
    } on DioException catch (e) {
      Print.red(e.response);
    }
  }

  @override
  void onInit() {
    indexProfile();
    super.onInit();
  }
}
