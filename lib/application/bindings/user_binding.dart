import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/login_controller.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/logout_controller.dart';
import 'package:laraflutter/application/controllers/user_controllers.dart/profile_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => LogoutController());
    Get.lazyPut(() => LoginController());
  }
}
