import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laraflutter/application/composables/discount_calculate.dart';
import 'package:laraflutter/application/controllers/cart_controllers/cart_controllers.dart';
import 'package:laraflutter/application/controllers/product_controllers/product_show_controllers.dart';
import 'package:laraflutter/config/api.dart';
import 'package:laraflutter/constant/colors.dart';
import 'package:laraflutter/ui/layouts/page_navbar_layout.dart';

class ProductsShowIndexPage extends StatelessWidget {
  const ProductsShowIndexPage({super.key});
  @override
  Widget build(BuildContext context) {
    ProductShowController productController = Get.find();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return productController.productShowData.value.product == null
                    ? const CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PageNavbarLayout(
                              title: productController
                                  .productShowData.value.product!.nameEn!,
                              titleFontSize: 14.sp),
                          SizedBox(
                            height: 10.w,
                          ),
                          _buildImages(productController),
                          _buildName(productController),
                          _buildContent(productController),
                          const Divider(),
                          _buildSizes(productController),
                          const Divider(),
                          _buildPriceAndCart(productController),
                          const Divider(),
                          _buildWarningText(productController),
                          _buildCartButton(productController),
                        ],
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWarningText(ProductShowController productController) {
    return productController.productShowData.value.productOrderStatus == null
        ? const SizedBox()
        : Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.info_outline,
                  color: Colors.orange,
                ),
                title: Text(productController
                            .productShowData.value.productOrderStatus ==
                        'pending'
                    ? 'You already order this product and is in pending'
                    : productController
                                .productShowData.value.productOrderStatus ==
                            'canceled'
                        ? 'You already order this product and it was canceled , also you can order again!'
                        : productController
                                    .productShowData.value.productOrderStatus ==
                                'onTheWay'
                            ? 'Your order it is on the way'
                            : "You already order this product, Order again?"),
              ),
            ],
          );
  }

  Widget _buildCartButton(ProductShowController productShowController) {
    CartController cartController = Get.find();

    return InkWell(
      onTap: () async {
        await productShowController.addToCart(
            productShowController.productShowData.value.product!.id.toString());
        cartController.indexCartReload();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
        decoration: BoxDecoration(
            color: productShowController.productShowData.value.productInCart! ||
                    productShowController.isInCart.value
                ? Colors.grey.shade200
                : AppColors.primary,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            productShowController.loadingAddToCart.value == true
                ? SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : const SizedBox(),
            Icon(
              Icons.shopping_bag,
              color:
                  productShowController.productShowData.value.productInCart! ||
                          productShowController.isInCart.value
                      ? AppColors.primary
                      : Colors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              productShowController.productShowData.value.productInCart! ||
                      productShowController.isInCart.value
                  ? "Show cart"
                  : "Add to cart",
              style: TextStyle(
                  color: productShowController
                              .productShowData.value.productInCart! ||
                          productShowController.isInCart.value
                      ? AppColors.primary
                      : Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildImages(ProductShowController productController) {
    return SizedBox(
      height: 500.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.sp),
              child: Image.network(
                  '${ApiConfig.baseUrlFile}/storage/${productController.selectedImage.value.isEmpty ? productController.productShowData.value.product!.images![0] : productController.selectedImage.value}'),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                ...productController.productShowData.value.product!.images!
                    .map((e) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  border:
                                      productController.selectedImage.value != e
                                          ? Border.all(
                                              width: 5.sp,
                                              color: Colors.transparent)
                                          : Border.all(
                                              width: 5.sp,
                                              color: AppColors.primary)),
                              child: InkWell(
                                onTap: () {
                                  productController.selectedImage.value = e;
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  child: Image.network(
                                    '${ApiConfig.baseUrlFile}/storage/$e',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildName(ProductShowController productController) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
        child: Text(
          productController.productShowData.value.product!.nameEn!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Padding _buildContent(ProductShowController productController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      child: Text(
        productController.productShowData.value.product!.contentEn!,
        style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Padding _buildPriceAndCart(ProductShowController productController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.sp)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IQD ${discountCalculate(
                    originalPrice: double.parse(productController
                        .productShowData.value.product!.price!),
                    discountPercentage: double.parse(
                      productController
                          .productShowData.value.product!.discount!,
                    ),
                  )}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          double.parse(productController
                      .productShowData.value.product!.discount!) <
                  1
              ? const SizedBox()
              : Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IQD ${double.parse(productController.productShowData.value.product!.price!).toStringAsFixed(0)}',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Discount',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
          const Spacer(),
        ],
      ),
    );
  }

  Padding _buildSizes(ProductShowController productController) {
    return Padding(
      padding: EdgeInsets.all(15.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sizes',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Wrap(
            children: [
              ...productController.productShowData.value.product!.sizes!.map(
                (e) => Padding(
                  padding: EdgeInsets.all(5.w),
                  child: InkWell(
                    onTap: () {
                      productController.selectedSize.value = e.toString();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: productController.selectedSize.value ==
                                  e.toString()
                              ? AppColors.primary
                              : Colors.grey.shade200),
                      padding: EdgeInsets.all(10.w),
                      child: Text(
                        e.toString(),
                        style: TextStyle(
                          color: productController.selectedSize.value ==
                                  e.toString()
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
