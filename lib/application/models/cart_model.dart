import 'dart:convert';

class CartDataModel {
    final String? success;
    final Data? data;

    CartDataModel({
        this.success,
        this.data,
    });

    CartDataModel copyWith({
        String? success,
        Data? data,
    }) => 
        CartDataModel(
            success: success ?? this.success,
            data: data ?? this.data,
        );

    factory CartDataModel.fromRawJson(String str) => CartDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CartDataModel.fromJson(Map<String, dynamic> json) => CartDataModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    final int? id;
    final int? userId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<CartItemModel>? items;

    Data({
        this.id,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.items,
    });

    Data copyWith({
        int? id,
        int? userId,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<CartItemModel>? items,
    }) => 
        Data(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            items: items ?? this.items,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        items: json["items"] == null ? [] : List<CartItemModel>.from(json["items"]!.map((x) => CartItemModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class CartItemModel {
    final int? id;
    final int? cartId;
    final int? productId;
    final String? size;
    final String? color;
    final int? quantity;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Product? product;

    CartItemModel({
        this.id,
        this.cartId,
        this.productId,
        this.size,
        this.color,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.product,
    });

    CartItemModel copyWith({
        int? id,
        int? cartId,
        int? productId,
        String? size,
        String? color,
        int? quantity,
        DateTime? createdAt,
        DateTime? updatedAt,
        Product? product,
    }) => 
        CartItemModel(
            id: id ?? this.id,
            cartId: cartId ?? this.cartId,
            productId: productId ?? this.productId,
            size: size ?? this.size,
            color: color ?? this.color,
            quantity: quantity ?? this.quantity,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            product: product ?? this.product,
        );

    factory CartItemModel.fromRawJson(String str) => CartItemModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json["id"],
        cartId: json["cart_id"],
        productId: json["product_id"],
        size: json["size"],
        color: json["color"],
        quantity: json["quantity"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cart_id": cartId,
        "product_id": productId,
        "size": size,
        "color": color,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toJson(),
    };
}

class Product {
    final int? id;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final String? contentEn;
    final String? contentAr;
    final String? contentKu;
    final String? rating;
    final String? price;
    final String? discount;
    final List<String>? images;
    final String? youtubeIframe;
    final String? instagramPostLink;
    final List<String>? colors;
    final List<String>? sizes;
    final int? categoryId;
    final int? subcategoryId;
    final int? brandId;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Product({
        this.id,
        this.nameEn,
        this.nameAr,
        this.nameKu,
        this.contentEn,
        this.contentAr,
        this.contentKu,
        this.rating,
        this.price,
        this.discount,
        this.images,
        this.youtubeIframe,
        this.instagramPostLink,
        this.colors,
        this.sizes,
        this.categoryId,
        this.subcategoryId,
        this.brandId,
        this.createdAt,
        this.updatedAt,
    });

    Product copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? nameKu,
        String? contentEn,
        String? contentAr,
        String? contentKu,
        String? rating,
        String? price,
        String? discount,
        List<String>? images,
        String? youtubeIframe,
        String? instagramPostLink,
        List<String>? colors,
        List<String>? sizes,
        int? categoryId,
        int? subcategoryId,
        int? brandId,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Product(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            nameKu: nameKu ?? this.nameKu,
            contentEn: contentEn ?? this.contentEn,
            contentAr: contentAr ?? this.contentAr,
            contentKu: contentKu ?? this.contentKu,
            rating: rating ?? this.rating,
            price: price ?? this.price,
            discount: discount ?? this.discount,
            images: images ?? this.images,
            youtubeIframe: youtubeIframe ?? this.youtubeIframe,
            instagramPostLink: instagramPostLink ?? this.instagramPostLink,
            colors: colors ?? this.colors,
            sizes: sizes ?? this.sizes,
            categoryId: categoryId ?? this.categoryId,
            subcategoryId: subcategoryId ?? this.subcategoryId,
            brandId: brandId ?? this.brandId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        nameKu: json["name_ku"],
        contentEn: json["content_en"],
        contentAr: json["content_ar"],
        contentKu: json["content_ku"],
        rating: json["rating"],
        price: json["price"],
        discount: json["discount"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        youtubeIframe: json["youtube_iframe"],
        instagramPostLink: json["instagram_post_link"],
        colors: json["colors"] == null ? [] : List<String>.from(json["colors"]!.map((x) => x)),
        sizes: json["sizes"] == null ? [] : List<String>.from(json["sizes"]!.map((x) => x)),
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        brandId: json["brand_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "name_ku": nameKu,
        "content_en": contentEn,
        "content_ar": contentAr,
        "content_ku": contentKu,
        "rating": rating,
        "price": price,
        "discount": discount,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "youtube_iframe": youtubeIframe,
        "instagram_post_link": instagramPostLink,
        "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "sizes": sizes == null ? [] : List<dynamic>.from(sizes!.map((x) => x)),
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "brand_id": brandId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
