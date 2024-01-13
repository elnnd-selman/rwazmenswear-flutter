import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_controllers.dart';
import 'package:laraflutter/application/models/brand_model.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/constant/colors.dart';

class ProductBrandListWidget extends StatelessWidget {
  const ProductBrandListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.w,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'Brands',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
        ),
        Obx(() => productController.brandData.value.data == null
            ? const CircularProgressIndicator()
            : SizedBox(
                height: 85.w,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 20.w),
                        child: Obx(
                          () => InkWell(
                            onTap: () {
                              productController.onBrandChange('');
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration: BoxDecoration(
                                      color: productController
                                                  .selectedBrandId.value !=
                                              ''
                                          ? Colors.white
                                          : AppColors.primary,
                                      borderRadius:
                                          BorderRadius.circular(100.sp),
                                      border: Border.all(
                                          width: 1, color: AppColors.primary)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.sp),
                                    child: Center(
                                        child: Text(
                                      'All',
                                      style: TextStyle(
                                          color: productController
                                                      .selectedBrandId.value ==
                                                  ''
                                              ? Colors.white
                                              : AppColors.primary),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  'All brands',
                                  style: TextStyle(
                                      color: productController
                                                  .selectedBrandId.value ==
                                              ""
                                          ? AppColors.primary
                                          : Colors.grey,
                                      fontSize: productController
                                                  .selectedBrandId.value ==
                                              ""
                                          ? 12.sp
                                          : 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ...List.generate(
                        productController.brandData.value.data!.length,
                        (index) {
                      List<BrandModel> brands =
                          productController.brandData.value.data!;
                      BrandModel brand = brands[index];
                      return SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 20.w),
                          child: Obx(
                            () => InkWell(
                              onTap: () {
                                productController
                                    .onBrandChange(brand.id.toString());
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 40.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.sp),
                                        border: productController
                                                    .selectedBrandId.value ==
                                                brand.id.toString()
                                            ? Border.all(
                                                width: 3,
                                                color: AppColors.primary)
                                            : null),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.sp),
                                      child: Image.network(
                                        '${ApiConfig.baseUrlFile}storage/${brand.image!}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Text(
                                    brand.nameEn!,
                                    style: TextStyle(
                                        color: productController
                                                    .selectedBrandId.value ==
                                                brand.id.toString()
                                            ? AppColors.primary
                                            : Colors.grey,
                                        fontSize: productController
                                                    .selectedBrandId.value ==
                                                brand.id.toString()
                                            ? 12.sp
                                            : 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              )),
      ],
    );
  }
}
