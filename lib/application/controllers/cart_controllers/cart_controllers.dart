import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/models/cart_model.dart';
import 'package:laraflutter/composables/calculate_discount.dart';
import 'package:laraflutter/composables/error_handle.dart';
import 'package:laraflutter/config/api.dart';
import 'package:print_color/print_color.dart';

class CartController extends GetxController {
  var loadingCarts = false.obs;

  var totalPrice = 0.0.obs;
  var totalDiscount = 0.0.obs;

  Rx<CartDataModel> cartData = CartDataModel().obs;

  indexCart() async {
    try {
      loadingCarts.value = true;
      var response = await ApiConfig(url: 'carts').get();
      cartData.value = CartDataModel.fromJson(response.data);
      calculateTotals();

      loadingCarts.value = false;
    } on DioException catch (e) {
      errorHandle(e.response!.data!);
      loadingCarts.value = false;
    }
  }

  indexCartReload() async {
    indexCart();
  }

  Future<bool> updateQuanity(int quantity, String cartItemId) async {
    try {
      await ApiConfig(url: 'carts/update/$cartItemId')
          .patch(data: {'quantity': quantity});
      indexCart();
      return true;
    } on DioException catch (e) {
      errorHandle(e.response!.data!);
      return false;
    }
  }

  void calculateTotals() {
    double calculatedTotalPrice = 0.0;
    double calculatedTotalDiscount = 0.0;

    for (var item in cartData.value.data!.items!) {
      double originalPrice = double.parse(item.product!.price!);
      double discountPercentage = double.parse(item.product!.discount!);
      int quantity = item.quantity!;

      double discountedPrice =
          calculateDiscount(originalPrice, discountPercentage);
      double totalItemPrice = discountedPrice * quantity;
      double totalItemDiscount = (originalPrice - discountedPrice) * quantity;

      calculatedTotalPrice += totalItemPrice;
      calculatedTotalDiscount += totalItemDiscount;
    }

    totalPrice.value = calculatedTotalPrice;
    totalDiscount.value = calculatedTotalDiscount;
  }

  @override
  void onInit() {
    indexCart();
    super.onInit();
  }
}
