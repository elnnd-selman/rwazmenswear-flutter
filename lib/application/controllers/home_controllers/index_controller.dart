import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexController extends GetxController {
  //
  late PageController pageController;
  var currentPage = 0.obs;
  onPageChanged(int page) {
    currentPage.value=page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }
}
