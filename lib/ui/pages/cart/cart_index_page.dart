import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/cart_controllers/cart_controllers.dart';
import 'package:laraflutter/application/models/cart_model.dart';
import 'package:laraflutter/ui/widgets/carts/cart_cart_widget.dart';
import 'package:laraflutter/ui/widgets/home/full_button_widget.dart';

class CartIndexPage extends StatelessWidget {
  const CartIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Scaffold(
      body: Obx(
        () => cartController.cartData.value.data == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'My Cart',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.w),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          cartController.cartData.value.data!.items!.length,
                      itemBuilder: (context, index) {
                        CartItemModel cart =
                            cartController.cartData.value.data!.items![index];
                        return CartCardWidget(cart: cart);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.discount,
                                    color: Colors.green,
                                  ),
                                  title: Text(
                                      cartController.totalDiscount.toString()),
                                  subtitle: const Text('Discount'),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.price_check,
                                    color: Colors.green,
                                  ),
                                  title: Text(
                                      cartController.totalPrice.toString()),
                                  subtitle: const Text('Price'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FullButtonWidget(
                            onTab: () {},
                            child: const Text(
                              'Checkout',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
