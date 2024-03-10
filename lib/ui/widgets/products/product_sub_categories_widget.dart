import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_controllers.dart';
import 'package:laraflutter/application/models/category_model.dart';
import 'package:laraflutter/constant/colors.dart';

class ProductSubCategoriesWidget extends StatelessWidget {
  const ProductSubCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Obx(() => productController.selectedCategory.value.subCategories ==
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
                    'Sub Categories',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.w),
                  child: SizedBox(
                    width: double.infinity,
                    height: 30.w,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Obx(() => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: InkWell(
                                onTap: () {
                                  productController.onSubCategoryChange(null);
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: productController
                                                  .selectedSubCategoryId
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
                                                      .selectedSubCategoryId
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
                            productController.selectedCategory.value
                                .subCategories!.length, (index) {
                          SubCategoryModel subcategory = productController
                              .selectedCategory.value.subCategories![index];
                          return Obx(
                            () => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: InkWell(
                                onTap: () {
                                  productController
                                      .onSubCategoryChange(subcategory);
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: subcategory.id!.toString() ==
                                              productController
                                                  .selectedSubCategoryId
                                                  .toString()
                                          ? AppColors.primary
                                          : Colors.grey.shade200,
                                      borderRadius:
                                          BorderRadius.circular(7.sp)),
                                  child: Center(
                                    child: Text(
                                      subcategory.nameEn!,
                                      style: TextStyle(
                                          color: subcategory.id!.toString() ==
                                                  productController
                                                      .selectedSubCategoryId
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
              ]));
  }
}
