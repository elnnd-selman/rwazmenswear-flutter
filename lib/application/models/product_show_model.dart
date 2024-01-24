import 'dart:convert';

import 'package:laraflutter/application/models/product_model.dart';

class ProductShowDataModel {
    final ProductModel? product;
    final dynamic productOrderStatus;
    final bool? productInCart;

    ProductShowDataModel({
        this.product,
        this.productOrderStatus,
        this.productInCart,
    });

    ProductShowDataModel copyWith({
        ProductModel? product,
        dynamic productOrderStatus,
        bool? productInCart,
    }) => 
        ProductShowDataModel(
            product: product ?? this.product,
            productOrderStatus: productOrderStatus ?? this.productOrderStatus,
            productInCart: productInCart ?? this.productInCart,
        );

    factory ProductShowDataModel.fromRawJson(String str) => ProductShowDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductShowDataModel.fromJson(Map<String, dynamic> json) => ProductShowDataModel(
        product: json["product"] == null ? null : ProductModel.fromJson(json["product"]),
        productOrderStatus: json["productOrderStatus"],
        productInCart: json["productInCart"],
    );

    Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "productOrderStatus": productOrderStatus,
        "productInCart": productInCart,
    };
}
