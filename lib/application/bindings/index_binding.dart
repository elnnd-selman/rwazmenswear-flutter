import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/index_controller.dart';

class IndexBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndexController());
  }
}
