import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_controllers.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
