import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/home_controllers/home_controllers.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
