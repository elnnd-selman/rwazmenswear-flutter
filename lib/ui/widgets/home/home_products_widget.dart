import 'package:flutter/material.dart';
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
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Latest Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Obx(
          () {
            List<ProductModel>? products =
                homeController.productData.value.data;
            return products == null
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) => Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 220,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                          width: 220,
                                          height: 220,
                                          child: Image.network(
                                            '${ApiConfig.baseUrlFile}storage/${products[index].images![0]}',
                                            fit: BoxFit.cover,
                                          )),
                                      double.parse(products[index]
                                                      .discount!) <
                                                  1
                                              ? const SizedBox()
                                              :   Positioned(
                                          child: Container(
                                        width: 80,
                                        height: 25,
                                        decoration:
                                            const BoxDecoration(color: Colors.red,borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10))),
                                        child: Center(
                                            child: Text(
                                         '${double.parse(products[index]
                                                      .discount!).toStringAsFixed(1)}%',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      products[index].nameEn!,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${calculateDiscount(
                                                        double.parse(
                                                            products[index]
                                                                .price!),
                                                        double.parse(
                                                            products[index]
                                                                .discount!))} IQD',
                                            maxLines: 1,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          double.parse(products[index]
                                                      .discount!) <
                                                  1
                                              ? const SizedBox()
                                              : SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    '${products[index].price!} IQD',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                    ),
                  );
          },
        ),
      ],
    );
  }
}
