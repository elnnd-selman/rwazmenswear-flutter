import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/cart_controllers/cart_controllers.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
