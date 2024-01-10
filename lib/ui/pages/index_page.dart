import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/index_controller.dart';
import 'package:laraflutter/ui/layouts/app_bar.dart';
import 'package:laraflutter/ui/layouts/app_bottom_navigationbar.dart';
import 'package:laraflutter/ui/pages/home/home_index_page.dart';
import 'package:laraflutter/ui/pages/products/product_index_page.dart';

class IndexPage extends StatelessWidget {
  IndexPage({super.key});
  final IndexController indexController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const AppBarLayout(),
          Expanded(
            child: PageView(
              controller: indexController.pageController,
              children: const [
                HomeIndexPage(),
                ProductsIndexPage(),
                HomeIndexPage(),
                HomeIndexPage()
              ],
            ),
          ),
          AppBottomNavigationBar()
        ],
      )),
    );
  }
}
