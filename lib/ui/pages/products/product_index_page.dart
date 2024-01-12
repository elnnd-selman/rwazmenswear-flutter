import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_controllers.dart';
import 'package:laraflutter/ui/widgets/products/product_brand_list_widget.dart';
import 'package:laraflutter/ui/widgets/products/product_categories_widget.dart';
import 'package:laraflutter/ui/widgets/products/products_grid_widget.dart';

class ProductsIndexPage extends StatelessWidget {
  const ProductsIndexPage({super.key});
  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();

    return SingleChildScrollView(
      controller: productController.productScrollController,
      child: const Column(
        children: [ProductBrandListWidget(),ProductCategoriesWidget(), ProductGridWidget()],
      ),
    );
  }
}
