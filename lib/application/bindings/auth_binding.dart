import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/forgot_password_controller.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/login_controller.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/register_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
  
    Get.lazyPut(() => ForgotPasswordController());
  }
}
