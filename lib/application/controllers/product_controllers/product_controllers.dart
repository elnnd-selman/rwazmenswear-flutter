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
    TextEditingController searchQuery = TextEditingController();

  Rx<dynamic> selectedMainCategoryId = ''.obs;
  Rx<dynamic> selectedCategoryId = ''.obs;
  Rx<dynamic> selectedSubCategoryId = ''.obs;

  Rx<dynamic> selectedBrandId = ''.obs;
  Rx<MainCategoryModel> selectedMainCategory = MainCategoryModel().obs;

  Rx<CategoryModel> selectedCategory = CategoryModel().obs;

  var page = 1.obs;

  final ScrollController productScrollController = ScrollController();

//PRODUCT
  Rx<ProductDataModel> productData = ProductDataModel().obs;
  productIndex(
      {String? categoryId,
      String? mainCategoryId,
      String? page,
      String? brandId,
      String? search,
      String? subCategoryId}) async {
    var response = await ApiConfig(
            url:
                'productapi?${page != null ? 'page=$page' : 'page=1'}${search != null ? '&search=$search' : ""}${mainCategoryId != null ? '&main_category_id=$mainCategoryId' : ""}${categoryId != null ? '&category_id=$categoryId' : ""}${subCategoryId != null ? '&sub_category_id=$subCategoryId' : ""}${brandId != null ? "&brand_id=$brandId" : ""}')
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
    productIndex(
        mainCategoryId: selectedMainCategoryId.value,
        categoryId: selectedCategoryId.value,
        subCategoryId: selectedSubCategoryId.value,
        brandId: brandId,
        page: page.value.toString());
  }

  //PAGINATE PRODUCT
  paginateProductIndex(
      {String? categoryId, String? page, String? brandId}) async {
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

//MAIN CATEGORIES
  var mainCategoriesData = [].obs;
  mainCategoriesIndex() async {
    var response = await ApiConfig(url: 'main-categoriesapi').get();
    List datas = response.data as List;
    mainCategoriesData.value = datas
        .map((e) => MainCategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  onSubCategoryChange(
    SubCategoryModel? subcategory,
  ) {
    page.value = 1;
    productsIsLoading.value = true;
    selectedSubCategoryId.value =
        subcategory != null ? subcategory.id.toString() : "";
    productIndex(
      mainCategoryId: selectedMainCategoryId.value,
      categoryId: selectedCategoryId.value,
      subCategoryId: selectedSubCategoryId.value,
      brandId: selectedBrandId.value,
    );
  }

  onCategoryChange(
    CategoryModel? category,
  ) {
    page.value = 1;
    productsIsLoading.value = true;
    selectedCategoryId.value = category != null ? category.id.toString() : "";
    selectedCategory.value = category ?? CategoryModel();
    productIndex(
      mainCategoryId: selectedMainCategoryId.value,
      categoryId: selectedCategoryId.value,
      brandId: selectedBrandId.value,
    );
  }

  onMainCategoryChange(
    MainCategoryModel? mainCategory,
  ) {
    page.value = 1;
    productsIsLoading.value = true;
    selectedMainCategoryId.value =
        mainCategory != null ? mainCategory.id.toString() : "";
    selectedCategory.value = CategoryModel();

    selectedCategoryId.value = '';
    selectedSubCategoryId.value = '';

    selectedMainCategory.value = mainCategory ?? MainCategoryModel();
    productIndex(
      mainCategoryId: selectedMainCategoryId.value,
      brandId: selectedBrandId.value,
    );
  }

//SEARCH
  onSearch(String searchQuery) {
    page.value = 1;
    productsIsLoading.value = true;
    productIndex(
        mainCategoryId: selectedMainCategoryId.value,
        categoryId: selectedCategoryId.value,
        subCategoryId: selectedSubCategoryId.value,
        brandId: selectedBrandId.value,
        search: searchQuery,
        page: page.value.toString());
  }

  onPageChange() {
    page.value += 1;
    paginateProductIndex(
        categoryId: selectedCategoryId.value,
        page: page.value.toString(),
        brandId: selectedBrandId.value);
  }

  @override
  void onInit() {
    productIndex();
    mainCategoriesIndex();
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
