import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_controllers.dart';
import 'package:laraflutter/application/models/brand_model.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/constant/colors.dart';

class ProductBrandListWidget extends StatelessWidget {
  final String size;
  final bool showTitle;

  const ProductBrandListWidget(
      {super.key, this.size = 'small', this.showTitle = true});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !showTitle
            ? const SizedBox()
            : SizedBox(
                height: 30.w,
              ),
        !showTitle
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Brands',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
        Obx(
          () => productController.brandData.value.data == null
              ? const CircularProgressIndicator()
              : SizedBox(
                  height: size == 'small'
                      ? 85.w
                      : size == 'medium'
                          ? 100.w
                          : size == 'large'
                              ? 120
                              : 85,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size == 'small'
                                  ? 10.w
                                  : size == 'medium'
                                      ? 16.w
                                      : 16.w,
                              top: 20.w),
                          child: Obx(
                            () => InkWell(
                              onTap: () {
                                productController.onBrandChange('');
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: size == 'small'
                                        ? 40.w
                                        : size == 'medium'
                                            ? 55.w
                                            : size == 'large'
                                                ? 60
                                                : 50,
                                    height: size == 'small'
                                        ? 40.w
                                        : size == 'medium'
                                            ? 55.w
                                            : size == 'large'
                                                ? 60
                                                : 40,
                                    decoration: BoxDecoration(
                                        color: productController
                                                    .selectedBrandId.value !=
                                                ''
                                            ? Colors.white
                                            : AppColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(100.sp),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.primary)),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.sp),
                                      child: Center(
                                          child: Text(
                                        'All',
                                        style: TextStyle(
                                            color: productController
                                                        .selectedBrandId
                                                        .value ==
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
                            padding: EdgeInsets.only(
                                left: size == 'small'
                                    ? 20.w
                                    : size == 'medium'
                                        ? 25.w
                                        : 20.w,
                                top: 20.w),
                            child: Obx(
                              () => InkWell(
                                onTap: () {
                                  productController
                                      .onBrandChange(brand.id.toString());
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: size == 'small'
                                          ? 40.w
                                          : size == 'medium'
                                              ? 55.w
                                              : size == 'large'
                                                  ? 60
                                                  : 50,
                                      height: size == 'small'
                                          ? 40.w
                                          : size == 'medium'
                                              ? 55.w
                                              : size == 'large'
                                                  ? 60
                                                  : 50,
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
                ),
        ),
      ],
    );
  }
}
