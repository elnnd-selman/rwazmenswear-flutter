import 'package:get/get.dart';
import 'package:laraflutter/application/models/blog_model.dart';
import 'package:laraflutter/application/models/offer_model.dart';
import 'package:laraflutter/application/models/product_model.dart';
import 'package:laraflutter/application/models/rek_model.dart';
import 'package:laraflutter/config/api.dart';
import 'package:print_color/print_color.dart';

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
    Print.green(response);
    productData.value =
        ProductDataModel.fromJson(response.data as Map<String, dynamic>);
  }

//BlOG
  Rx<BlogDataModel> blogData = BlogDataModel().obs;
  blogIndex() async {
    var response = await ApiConfig(url: 'blogapi').get();
    blogData.value =
        BlogDataModel.fromJson(response.data as Map<String, dynamic>);
  }

  Rx<OfferDataModel> offerData = OfferDataModel().obs;

  offerIndex() async {
    var response = await ApiConfig(url: 'offerapi').get();
    offerData.value =
        OfferDataModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  void onInit() {
    rekIndex();
    productIndex();
    blogIndex();
    offerIndex();
    super.onInit();
  }
}
