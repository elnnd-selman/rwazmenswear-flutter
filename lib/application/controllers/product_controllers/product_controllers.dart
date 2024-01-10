import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/models/category_model.dart';
import 'package:laraflutter/application/models/product_model.dart';
import 'package:laraflutter/config/api.dart';
import 'package:print_color/print_color.dart';

class ProductController extends GetxController {
  var productsIsLoading = true.obs;
  var productsNextPageIsLoading = false.obs;

  Rx<dynamic> selectedCategoryId = ''.obs;
  var page = 1.obs;

  final ScrollController productScrollController = ScrollController();

//PRODUCT
  Rx<ProductDataModel> productData = ProductDataModel().obs;
  productIndex({String? categoryId, String? page}) async {
    Print.green('BEFORE ${productsNextPageIsLoading.value}');
    var response = await ApiConfig(
            url:
                'productapi?${page != null ? 'page=$page' : ''}${categoryId != null ? 'category_id=$categoryId' : ""}')
        .get();

    Print.green('AFTER ${productsNextPageIsLoading.value}');
    productData.value =
        ProductDataModel.fromJson(response.data as Map<String, dynamic>);
    productsIsLoading.value = false;
    productsNextPageIsLoading.value = false;
  }

  //BRAND
  brandIndex({String? categoryId, String? page}) async {
    Print.green('BEFORE ${productsNextPageIsLoading.value}');
    var response = await ApiConfig(
            url:
                'brandapi?${page != null ? 'page=$page' : ''}')
        .get();


    Print.green('AFTER ${productsNextPageIsLoading.value}');
    productData.value =
        ProductDataModel.fromJson(response.data as Map<String, dynamic>);
    productsIsLoading.value = false;
    productsNextPageIsLoading.value = false;
  }

  //PAGINATE PRODUCT
  paginateProductIndex({String? categoryId, String? page}) async {
    Print.green('BEFORE ${productsNextPageIsLoading.value}');
    var response = await ApiConfig(
            url:
                'productapi?${page != null ? 'page=$page' : ''}&${categoryId != null&&selectedCategoryId.value.length>0 ? 'category_id=$categoryId' : ""}')
        .get();

    Print.green('AFTER ${productsNextPageIsLoading.value}');
    List<ProductModel> prevProducts=productData.value.data!;
    productData.value =
        ProductDataModel.fromJson(response.data as Map<String, dynamic>);
        productData.value.data!.insertAll(0,prevProducts);
    productsNextPageIsLoading.value = false;
  }

//CATEGORIES
  Rx<CategoryDataModel> categoryData = CategoryDataModel().obs;
  categoriesIndex() async {
    var response = await ApiConfig(url: 'categoriesapi').get();
    categoryData.value =
        CategoryDataModel.fromJson(response.data as Map<String, dynamic>);
  }

  onCategoryChange(String? categoryId) {
    page.value=1;
    productsIsLoading.value = true;
    selectedCategoryId.value = categoryId ?? "";
    productIndex(categoryId: categoryId);
  }

  onPageChange() {
    page.value +=1;
    paginateProductIndex(
        categoryId: selectedCategoryId.value, page: page.value.toString());
  }

  @override
  void onInit() {
    productIndex();
    categoriesIndex();
    productScrollController.addListener(() {
      if (productScrollController.position.pixels >=
          productScrollController.position.maxScrollExtent) {
        if (productsNextPageIsLoading.isFalse&&productData.value.nextPageUrl!=null) {
          productsNextPageIsLoading.value = true;
          Print.green(productsNextPageIsLoading.value);
          onPageChange();
        }
      }
    });
    super.onInit();
  }
}
