import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_controllers.dart';
import 'package:laraflutter/application/models/category_model.dart';
import 'package:laraflutter/constant/colors.dart';

class ProductMainCategoriesWidget extends StatelessWidget {
  const ProductMainCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return 
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.w,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'Collections',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.w),
          child: Obx(
            () => SizedBox(
              width: double.infinity,
              height: 30.w,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Obx(() => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: InkWell(
                          onTap: () {
                            productController.onMainCategoryChange(null);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                                color: productController
                                            .selectedMainCategoryId.value ==
                                        ""
                                    ? AppColors.primary
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(7.sp)),
                            child: Center(
                              child: Text(
                                "All",
                                style: TextStyle(
                                    color: productController
                                                .selectedMainCategoryId.value ==
                                            ""
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      )),
                  ...List.generate(productController.mainCategoriesData.length,
                      (index) {
                    MainCategoryModel mainCategory =
                        productController.mainCategoriesData[index];
                    return Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: InkWell(
                          onTap: () {
                            productController
                                .onMainCategoryChange(mainCategory);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                                color: mainCategory.id!.toString() ==
                                        productController.selectedMainCategoryId
                                            .toString()
                                    ? AppColors.primary
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(7.sp)),
                            child: Center(
                              child: Text(
                                mainCategory.nameEn!,
                                style: TextStyle(
                                    color: mainCategory.id!.toString() ==
                                            productController.selectedMainCategoryId
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
    );
  }
}
