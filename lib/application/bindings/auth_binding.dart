import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/auth_controllers.dart/login_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
