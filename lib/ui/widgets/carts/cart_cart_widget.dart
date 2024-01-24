import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/composables/debouncer.dart';
import 'package:laraflutter/application/controllers/cart_controllers/cart_controllers.dart';
import 'package:laraflutter/application/models/cart_model.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/constant/colors.dart';

class CartCardWidget extends StatefulWidget {
  final CartItemModel cart;
  const CartCardWidget({
    super.key,
    required this.cart,
  });

  @override
  State<CartCardWidget> createState() => _CartCardWidgetState();
}

class _CartCardWidgetState extends State<CartCardWidget> {
  int? quantity;
  final debouncerAdd = AppDebouncer(milliseconds: 500); // 500ms debounce time
  final debouncerRemove =
      AppDebouncer(milliseconds: 500); // 500ms debounce time

  @override
  void initState() {
    setState(() {
      quantity = widget.cart.quantity;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      child: SizedBox(
        height: 110.w,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 110.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.w),
                  child: Image.network(
                    '${ApiConfig.baseUrlFile}storage/${widget.cart.color!}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cart.product!.nameEn!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Size: ${widget.cart.size!}'),
                    Text('Price: ${widget.cart.product!.price!} IQD'),
                    const SizedBox(),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Material(
                              color: AppColors.primary, // Button color
                              child: SizedBox(
                                width: 30.w,
                                height: 30.w,
                                child: InkWell(
                                  splashColor: Colors.amber.shade500,
                                  onTap: () async {
                                    if (quantity! > 0) {
                                      if (quantity! == 1) {
                                        Get.defaultDialog(
                                            title: "Delete from cart?",
                                            middleText: '',
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  await updateCartQuantity(
                                                      cartController, false);
                                                  await cartController
                                                      .indexCartReload();
                                                  Get.back();
                                                },
                                                child: const Text('Delete'),
                                              )
                                            ]);
                                        return;
                                      }
                                      updateCartQuantity(cartController, false);
                                    }
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Text(
                              quantity.toString(),
                              style: TextStyle(
                                  fontSize: 14.w, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ClipOval(
                            child: Material(
                              color: AppColors.primary, // Button color
                              child: SizedBox(
                                width: 30.w,
                                height: 30.w,
                                child: InkWell(
                                  splashColor: Colors.amber.shade500,
                                  onTap: () async {
                                    if (quantity! > 0) {
                                      updateCartQuantity(cartController, true);
                                    }
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  updateCartQuantity(CartController cartController, bool isAdd) {
    debouncerRemove.run(() async {
      if (isAdd) {
        setState(() {
          quantity = quantity! + 1;
        });
      } else {
        setState(() {
          quantity = quantity! - 1;
        });
      }

      bool response = await cartController.updateQuanity(
          quantity!, widget.cart.id.toString());

      if (!response) {
        Get.back();
        setState(() {
          quantity = quantity! + 1;
        });
      }
    });
  }
}
