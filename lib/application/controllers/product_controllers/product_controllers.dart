import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/models/brand_model.dart';
import 'package:laraflutter/application/models/category_model.dart';
import 'package:laraflutter/application/models/product_model.dart';
import 'package:laraflutter/config/api.dart';
import 'package:print_color/print_color.dart';

class ProductController extends GetxController {
  var productsIsLoading = true.obs;
  var productsNextPageIsLoading = false.obs;

  Rx<dynamic> selectedCategoryId = ''.obs;
  Rx<dynamic> selectedBrandId = ''.obs;

  var page = 1.obs;

  final ScrollController productScrollController = ScrollController();

//PRODUCT
  Rx<ProductDataModel> productData = ProductDataModel().obs;
  productIndex({String? categoryId, String? page, String? brandId}) async {
    var response = await ApiConfig(
            url:
                'productapi?${page != null ? 'page=$page' : 'page=1'}${categoryId != null ? '&category_id=$categoryId' : ""}${brandId != null ? "&brand_id=$brandId" : ""}')
        .get();

    productData.value =
        ProductDataModel.fromJson(response.data as Map<String, dynamic>);
    productsIsLoading.value = false;
    productsNextPageIsLoading.value = false;
  }

  //BRAND
  Rx<BrandDataModel> brandData = BrandDataModel().obs;

  brandIndex({String? categoryId, String? page}) async {
    var response =
        await ApiConfig(url: 'brandapi?${page != null ? 'page=$page' : ''}')
            .get();

    brandData.value =
        BrandDataModel.fromJson(response.data as Map<String, dynamic>);
  }

  onBrandChange(String? brandId) {
    page.value = 1;
    productsIsLoading.value = true;
    selectedBrandId.value = brandId ?? "";
    productIndex(brandId: brandId,categoryId: selectedCategoryId.value,page: page.value.toString());
  }

  //PAGINATE PRODUCT
  paginateProductIndex({String? categoryId, String? page,String?brandId}) async {
    var response = await ApiConfig(
            url:
                'productapi?${page != null ? 'page=$page' : 'page=1'}&${categoryId != null && selectedCategoryId.value.length > 0 ? 'category_id=$categoryId' : ""}${brandId != null ? "&brand_id=$brandId" : ""}')
        .get();

    List<ProductModel> prevProducts = productData.value.data!;
    productData.value =
        ProductDataModel.fromJson(response.data as Map<String, dynamic>);
    productData.value.data!.insertAll(0, prevProducts);
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
    page.value = 1;
    productsIsLoading.value = true;
    selectedCategoryId.value = categoryId ?? "";
    productIndex(categoryId: categoryId,brandId: selectedBrandId.value);
  }

  onPageChange() {
    page.value += 1;
    paginateProductIndex(
        categoryId: selectedCategoryId.value, page: page.value.toString(),brandId:selectedBrandId.value);
  }

  @override
  void onInit() {
    productIndex();
    categoriesIndex();
    brandIndex();
    productScrollController.addListener(() {
      if (productScrollController.position.pixels >=
          productScrollController.position.maxScrollExtent) {
        if (productsNextPageIsLoading.isFalse &&
            productData.value.nextPageUrl != null) {
          productsNextPageIsLoading.value = true;
          Print.green(productsNextPageIsLoading.value);
          onPageChange();
        }
      }
    });
    super.onInit();
  }
}
