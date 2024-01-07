import 'package:get/get.dart';
import 'package:laraflutter/application/models/product_model.dart';
import 'package:laraflutter/application/models/rek_model.dart';
import 'package:laraflutter/config/api.dart';

class HomeController extends GetxController {
  //REK
  Rx<RekDataModel?> rekData = RekDataModel().obs;
  rekIndex() async {
    var response = await ApiConfig(url: 'rek').get();
    rekData.value =
        RekDataModel.fromJson(response.data as Map<String, dynamic>);
  }

//PRODUCT
  Rx<ProductDataModel> productData = ProductDataModel().obs;
  productIndex() async {
    var response = await ApiConfig(url: 'productapi').get();
    productData.value =
        ProductDataModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  void onInit() {
    rekIndex();
    productIndex();
    super.onInit();
  }
}
