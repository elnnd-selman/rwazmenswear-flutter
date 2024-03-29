import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_controllers.dart';
import 'package:laraflutter/application/models/category_model.dart';
import 'package:laraflutter/constant/colors.dart';

class ProductCategoriesWidget extends StatelessWidget {
  const ProductCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Obx(() => productController.selectedMainCategory.value.categories ==
            null
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Category',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.w),
                child: Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 30.w,
                    child: productController
                                .selectedMainCategory.value.categories ==
                            null
                        ? const SizedBox()
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Obx(() => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: InkWell(
                                      onTap: () {
                                        productController
                                            .onCategoryChange(null);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        decoration: BoxDecoration(
                                            color: productController
                                                        .selectedCategoryId
                                                        .value ==
                                                    ""
                                                ? AppColors.primary
                                                : Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(7.sp)),
                                        child: Center(
                                          child: Text(
                                            "All",
                                            style: TextStyle(
                                                color: productController
                                                            .selectedCategoryId
                                                            .value ==
                                                        ""
                                                    ? Colors.white
                                                    : Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              ...List.generate(
                                  productController.selectedMainCategory.value
                                      .categories!.length, (index) {
                                CategoryModel category = productController
                                    .selectedMainCategory
                                    .value
                                    .categories![index];
                                return Obx(
                                  () => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: InkWell(
                                      onTap: () {
                                        productController
                                            .onCategoryChange(category);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        decoration: BoxDecoration(
                                            color: category.id!.toString() ==
                                                    productController
                                                        .selectedCategoryId
                                                        .toString()
                                                ? AppColors.primary
                                                : Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(7.sp)),
                                        child: Center(
                                          child: Text(
                                            category.nameEn!,
                                            style: TextStyle(
                                                color: category.id!
                                                            .toString() ==
                                                        productController
                                                            .selectedCategoryId
                                                            .toString()
                                                    ? Colors.white
                                                    : Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList()
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ));
  }
}
