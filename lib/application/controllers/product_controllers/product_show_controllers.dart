import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laraflutter/application/models/product_show_model.dart';
import 'package:laraflutter/composables/error_handle.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/config/string_constant.dart';
import 'package:print_color/print_color.dart';

class ProductShowController extends GetxController {
  var productsIsLoading = true.obs;
  var isInCart = false.obs;
  var loadingAddToCart = false.obs;

  var selectedImage = ''.obs;
  var selectedSize = ''.obs;

  onSelectImage(String image) {
    selectedImage.value = image;
  }

//PRODUCT
  Rx<ProductShowDataModel> productShowData = ProductShowDataModel().obs;
  productShow(
    String id,
  ) async {
    try {
      productsIsLoading.value = true;

      var response = await ApiConfig(url: 'productapi/$id').get();
      Print.green(GetStorage().read(AppStringConstant.accessToken));
      Print.green(response.data);
      productShowData.value = ProductShowDataModel.fromJson(response.data);
      productsIsLoading.value = false;
    } on DioException catch (e) {
      errorHandle(e.response!.data!);
      productsIsLoading.value = false;
    }
  }

  Future addToCart(
    String productId,
  ) async {
    if (isInCart.value || productShowData.value.productInCart!) {
      return;
    }

    if (selectedImage.value.isEmpty) {
      Get.snackbar('Wrong!', 'Please select a product image',
          overlayColor: Colors.white, backgroundColor: Colors.white);
      return;
    }
    if (selectedSize.value.isEmpty) {
      Get.snackbar('Wrong!', 'Please select a product Size',
          overlayColor: Colors.white, backgroundColor: Colors.white);
      return;
    }
    try {
      loadingAddToCart.value = true;

      var response = await ApiConfig(url: 'carts/add/$productId').post(data: {
        'product_id': productShowData.value.product!.id,
        'quantity': 1,
        'size': selectedSize.value,
        'color': selectedImage.value,
      });

      isInCart.value = true;
      loadingAddToCart.value = false;

      Print.green(response.data);
    } on DioException catch (e) {
      errorHandle(e.response!.data!);
      loadingAddToCart.value = false;
    }
  }

  @override
  void onInit() {
    productShow(Get.parameters['id']!);

    super.onInit();
  }
}
