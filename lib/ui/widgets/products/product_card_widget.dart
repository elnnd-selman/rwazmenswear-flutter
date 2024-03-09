import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:laraflutter/application/models/product_model.dart';
import 'package:laraflutter/composables/calculate_discount.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/ui/responsive.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('product_show', parameters: {'id': product.id.toString()});
      },
      child: SizedBox(
        width: 220.w,
        height: Responsive.isMobile(context) ? 400.w : 300.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    padding: EdgeInsets.all(   Responsive.isMobile(context) ?10.sp:5.sp),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    width: 220.w,
                    height: Responsive.isMobile(context) ? 220.w : 150.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.sp),
                      child: Image.network(
                        '${ApiConfig.baseUrlFile}storage/${product.images![0].path}',
                        fit: BoxFit.cover,
                      ),
                    )),
                // double.parse(product.discount!) < 1
                true
                    ? const SizedBox()
                    : Positioned(
                        left: 10.w,
                        top: 10.w,
                        child: Container(
                          width: 84.w,
                          height: 25.w,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.sp))),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 15.w,
                                child: Iconify(
                                  Ic.outline_discount,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                '${double.parse(product.discount!).toStringAsFixed(1)}%',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                        ),
                      )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
              child: Text(
                product.nameEn!,
                maxLines: 2,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: Responsive.isMobile(context) ? 14.sp : 10.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    double.parse(product.discount!) < 1
                        ? const SizedBox()
                        : SizedBox(
                            width: 100.w,
                            child: Text(
                              '${double.parse(product.price!).toStringAsFixed(0)} IQD',
                              style: TextStyle(
                                  fontSize:   Responsive.isMobile(context) ? 14.sp:10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Text(
                      '${calculateDiscount(double.parse(product.price!), double.parse(product.discount!)).toStringAsFixed(0)} IQD',
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize:   Responsive.isMobile(context) ? 16.sp:12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
