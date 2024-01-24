import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/models/product_model.dart';
import 'package:laraflutter/composables/calculate_discount.dart';
import 'package:laraflutter/config/api.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.sp),
      child: InkWell(
        onTap: () {
          Get.toNamed('product_show',parameters: {'id':product.id.toString()});
        },
        child: Container(
          width: 220.w,
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: 220.w,
                      height: 220.w,
                      child: Image.network(
                        '${ApiConfig.baseUrlFile}storage/${product.images![0]}',
                        fit: BoxFit.cover,
                      )),
                  double.parse(product.discount!) < 1
                      ? const SizedBox()
                      : Positioned(
                          child: Container(
                          width: 80.w,
                          height: 25.w,
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                              child: Text(
                            '${double.parse(product.discount!).toStringAsFixed(1)}%',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
                child: Text(
                  product.nameEn!,
                  maxLines: 2,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.sp,
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
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
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
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
