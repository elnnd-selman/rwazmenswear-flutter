import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/home_controllers/home_controllers.dart';
import 'package:laraflutter/application/models/product_model.dart';
import 'package:laraflutter/composables/calculate_discount.dart';
import 'package:laraflutter/config/api.dart';

class HomeProductsWidget extends StatelessWidget {
  HomeProductsWidget({super.key});
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Text(
            'Latest Products',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Obx(
          () {
            List<ProductModel>? products =
                homeController.productData.value.data;
            return products == null
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 320.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.sp),
                          child: Container(
                            width: 220.w,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                        width: 220.w,
                                        height: 220.w,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.sp),
                                          child: Image.network(
                                            '${ApiConfig.baseUrlFile}storage/${products[index].images![0].path}',
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                    double.parse(products[index].discount!) < 1
                                        ? const SizedBox()
                                        : Positioned(
                                            child: Container(
                                            width: 80.w,
                                            height: 25.w,
                                            decoration: const BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10))),
                                            child: Center(
                                                child: Text(
                                              '${double.parse(products[index].discount!).toStringAsFixed(1)}%',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.w, left: 10.w, right: 10.w),
                                  child: Text(
                                    products[index].nameEn!,
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${calculateDiscount(double.parse(products[index].price!), double.parse(products[index].discount!)).toStringAsFixed(0)} IQD',
                                          maxLines: 1,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        double.parse(
                                                    products[index].discount!) <
                                                1
                                            ? const SizedBox()
                                            : SizedBox(
                                                width: 100.w,
                                                child: Text(
                                                  '${double.parse(products[index].price!).toStringAsFixed(0)} IQD',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.red),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
