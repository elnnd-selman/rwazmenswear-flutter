import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/home_controllers/index_controller.dart';
import 'package:laraflutter/constant/colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  AppBottomNavigationBar({super.key});
  final IndexController indexController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 60,
        decoration:
            BoxDecoration(color: Colors.grey.shade200, boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(58, 158, 158, 158),
              blurRadius: 1,
              offset: Offset(0, -2))
        ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                indexController.onPageChanged(0);
              },
              icon: indexController.currentPage.value == 0
                  ? Icon(Icons.home, color: AppColors.primary)
                  : const Icon(Icons.home_outlined),
            ),
            IconButton(
              onPressed: () {
                indexController.onPageChanged(1);
              },
              icon: indexController.currentPage.value == 1
                  ? Icon(Icons.store, color: AppColors.primary)
                  : const Icon(Icons.store_outlined),
            ),
            IconButton(
              onPressed: () {
                indexController.onPageChanged(2);
              },
              icon: indexController.currentPage.value == 2
                  ? Icon(Icons.local_mall, color: AppColors.primary)
                  : const Icon(Icons.local_mall_outlined),
            ),
            IconButton(
              onPressed: () {
                indexController.onPageChanged(3);
              },
              icon: indexController.currentPage.value == 3
                  ? Icon(Icons.shopping_cart, color: AppColors.primary)
                  : const Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
