import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_controllers.dart';
import 'package:laraflutter/application/models/product_model.dart';
import 'package:laraflutter/ui/responsive.dart';
import 'package:laraflutter/ui/widgets/products/product_card_widget.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Obx(() => productController.productsIsLoading.value
        ? const CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.isMobile(context)
                      ? 2
                      : 3, // number of items in each row
                  mainAxisSpacing: 10.0, // spacing between rows
                  childAspectRatio:
                      Responsive.isMobile(context) ? (1 / 1.5) : (1 / 1.7),

                  crossAxisSpacing: 10, // spacing between columns
                ),
                itemCount: productController.productData.value.data!.length,
                itemBuilder: (context, index) {
                  ProductModel product =
                      productController.productData.value.data![index];
                  return ProductCardWidget(product: product);
                },
              ),
              Obx(() => productController.productsNextPageIsLoading.isTrue
                  ? const CircularProgressIndicator()
                  : const SizedBox())
            ]),
          ));
  }
}
