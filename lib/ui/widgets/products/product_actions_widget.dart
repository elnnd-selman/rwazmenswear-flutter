import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/constant/colors.dart';
import 'package:laraflutter/ui/widgets/products/product_brand_list_widget.dart';
import 'package:laraflutter/ui/widgets/products/product_categories_widget.dart';
import 'package:laraflutter/ui/widgets/products/product_sub_categories_widget.dart';

class ProductActionWidget extends StatelessWidget {
  const ProductActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      width: double.infinity,
      height: 50.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20.w)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Search for products...',
                      style: TextStyle(
                          color: Colors.grey.shade500, fontSize: 12.w),
                    ),
                    Icon(
                      Icons.search_outlined,
                      color: Colors.grey.shade400,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            splashColor: AppColors.primary,
            onTap: () {
              Get.bottomSheet(Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton( onPressed: () {Get.back();}, child: Text('Ok',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold),))
                        ]),
                    const ProductBrandListWidget(),
                    const ProductCategoriesWidget(),
                    const ProductSubCategoriesWidget(),
                  ],
                ),
              ));
            },
            child: Container(
                height: double.infinity,
                width: 50.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15.sp)),
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
