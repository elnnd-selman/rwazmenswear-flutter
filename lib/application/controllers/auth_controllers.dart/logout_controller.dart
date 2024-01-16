import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laraflutter/composables/error_handle.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/config/string_constant.dart';
import 'package:print_color/print_color.dart';

class LogoutController extends GetxController {
  var loadingLogoutButton = false.obs;
  handleLogout() async {
    if (loadingLogoutButton.value) {
      return;
    }
    loadingLogoutButton.value = true;
    try {
      var response = await ApiConfig(url: 'logout').post();
      if (response.statusCode == 200) {
        GetStorage().remove(AppStringConstant.accessToken);
        GetStorage().remove(AppStringConstant.user);
        Get.offAllNamed('/login');
      }
      loadingLogoutButton.value = false;
    } on DioException catch (e) {
      loadingLogoutButton.value = false;
      Print.green(e.response);
      errorHandle(e);
    }
  }
}
