import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_controllers.dart';
import 'package:laraflutter/constant/colors.dart';
import 'package:laraflutter/ui/responsive.dart';
import 'package:laraflutter/ui/widgets/products/product_brand_list_widget.dart';
import 'package:laraflutter/ui/widgets/products/product_categories_widget.dart';
import 'package:laraflutter/ui/widgets/products/product_main_categories_widget.dart';
import 'package:laraflutter/ui/widgets/products/product_sub_categories_widget.dart';
import 'package:laraflutter/ui/widgets/text_field_widget.dart';

class ProductActionWidget extends StatelessWidget {
  const ProductActionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      width: double.infinity,
      height: Responsive.isMobile(context) ? 50.w : 35.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(
                      Responsive.isMobile(context) ? 20.w : 10.w)),
              child: TextFieldWidget(
                controller: productController.searchQuery,
                hintText: 'Search...',
                
                onChange: (v) => {
                  if (v!.isEmpty) {productController.onSearch('')}
                },
                suffixIcon: GestureDetector(
                  onTap: () {
                    productController
                        .onSearch(productController.searchQuery.text);
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: const Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Responsive.isMobile(context) ? 10.w : 5.w,
          ),
          InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  Responsive.isMobile(context) ? 14.sp : 7.sp),
            ),
            splashColor: AppColors.primary,
            onTap: () {
              Get.bottomSheet(Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold),
                                ))
                          ]),
                      const ProductBrandListWidget(),
                      const ProductMainCategoriesWidget(),
                      const ProductCategoriesWidget(),
                      const ProductSubCategoriesWidget(),
                    ],
                  ),
                ),
              ));
            },
            child: Container(
                height: double.infinity,
                width: Responsive.isMobile(context) ? 50.w : 35.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(
                        Responsive.isMobile(context) ? 15.sp : 7.5.sp)),
                child: Icon(
                  Icons.tune_outlined,
                  color: Colors.grey.shade400,
                )),
          )
        ],
      ),
    );
  }
}
