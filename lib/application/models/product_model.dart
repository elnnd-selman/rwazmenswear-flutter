import 'dart:convert';

class ProductDataModel {
    final int? currentPage;
    final List<ProductModel>? data;
    final String? firstPageUrl;
    final int? from;
    final int? lastPage;
    final String? lastPageUrl;
    final List<Link>? links;
    final dynamic nextPageUrl;
    final String? path;
    final int? perPage;
    final dynamic prevPageUrl;
    final int? to;
    final int? total;

    ProductDataModel({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    ProductDataModel copyWith({
        int? currentPage,
        List<ProductModel>? data,
        String? firstPageUrl,
        int? from,
        int? lastPage,
        String? lastPageUrl,
        List<Link>? links,
        dynamic nextPageUrl,
        String? path,
        int? perPage,
        dynamic prevPageUrl,
        int? to,
        int? total,
    }) => 
        ProductDataModel(
            currentPage: currentPage ?? this.currentPage,
            data: data ?? this.data,
            firstPageUrl: firstPageUrl ?? this.firstPageUrl,
            from: from ?? this.from,
            lastPage: lastPage ?? this.lastPage,
            lastPageUrl: lastPageUrl ?? this.lastPageUrl,
            links: links ?? this.links,
            nextPageUrl: nextPageUrl ?? this.nextPageUrl,
            path: path ?? this.path,
            perPage: perPage ?? this.perPage,
            prevPageUrl: prevPageUrl ?? this.prevPageUrl,
            to: to ?? this.to,
            total: total ?? this.total,
        );

    factory ProductDataModel.fromRawJson(String str) => ProductDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductDataModel.fromJson(Map<String, dynamic> json) => ProductDataModel(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<ProductModel>.from(json["data"]!.map((x) => ProductModel.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class ProductModel {
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
    final String? youtubeIframe;
    final String? instagramPostLink;
    final List<String>? sizes;
    final int? categoryId;
    final int? subcategoryId;
    final int? brandId;
    final int? mainCategoryId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic subCategory;
    final Category? category;
    final Category? mainCategory;
    final Brand? brand;
    final List<ProductImage>? images;

    ProductModel({
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
        this.youtubeIframe,
        this.instagramPostLink,
        this.sizes,
        this.categoryId,
        this.subcategoryId,
        this.brandId,
        this.mainCategoryId,
        this.createdAt,
        this.updatedAt,
        this.subCategory,
        this.category,
        this.mainCategory,
        this.brand,
        this.images,
    });

    ProductModel copyWith({
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
        String? youtubeIframe,
        String? instagramPostLink,
        List<String>? sizes,
        int? categoryId,
        int? subcategoryId,
        int? brandId,
        int? mainCategoryId,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic subCategory,
        Category? category,
        Category? mainCategory,
        Brand? brand,
        List<ProductImage>? images,
    }) => 
        ProductModel(
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
            youtubeIframe: youtubeIframe ?? this.youtubeIframe,
            instagramPostLink: instagramPostLink ?? this.instagramPostLink,
            sizes: sizes ?? this.sizes,
            categoryId: categoryId ?? this.categoryId,
            subcategoryId: subcategoryId ?? this.subcategoryId,
            brandId: brandId ?? this.brandId,
            mainCategoryId: mainCategoryId ?? this.mainCategoryId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            subCategory: subCategory ?? this.subCategory,
            category: category ?? this.category,
            mainCategory: mainCategory ?? this.mainCategory,
            brand: brand ?? this.brand,
            images: images ?? this.images,
        );

    factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
        youtubeIframe: json["youtube_iframe"],
        instagramPostLink: json["instagram_post_link"],
        sizes: json["sizes"] == null ? [] : List<String>.from(json["sizes"]!.map((x) => x)),
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        brandId: json["brand_id"],
        mainCategoryId: json["main_category_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        subCategory: json["sub_category"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        mainCategory: json["main_category"] == null ? null : Category.fromJson(json["main_category"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        images: json["images"] == null ? [] : List<ProductImage>.from(json["images"]!.map((x) => ProductImage.fromJson(x))),
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
        "youtube_iframe": youtubeIframe,
        "instagram_post_link": instagramPostLink,
        "sizes": sizes == null ? [] : List<dynamic>.from(sizes!.map((x) => x)),
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "brand_id": brandId,
        "main_category_id": mainCategoryId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "sub_category": subCategory,
        "category": category?.toJson(),
        "main_category": mainCategory?.toJson(),
        "brand": brand?.toJson(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    };
}

class Brand {
    final int? id;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final String? contentEn;
    final String? contentAr;
    final String? contentKu;
    final String? image;
    final String? link;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Brand({
        this.id,
        this.nameEn,
        this.nameAr,
        this.nameKu,
        this.contentEn,
        this.contentAr,
        this.contentKu,
        this.image,
        this.link,
        this.createdAt,
        this.updatedAt,
    });

    Brand copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? nameKu,
        String? contentEn,
        String? contentAr,
        String? contentKu,
        String? image,
        String? link,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Brand(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            nameKu: nameKu ?? this.nameKu,
            contentEn: contentEn ?? this.contentEn,
            contentAr: contentAr ?? this.contentAr,
            contentKu: contentKu ?? this.contentKu,
            image: image ?? this.image,
            link: link ?? this.link,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Brand.fromRawJson(String str) => Brand.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        nameKu: json["name_ku"],
        contentEn: json["content_en"],
        contentAr: json["content_ar"],
        contentKu: json["content_ku"],
        image: json["image"],
        link: json["link"],
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
        "image": image,
        "link": link,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Category {
    final int? id;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final int? mainCategoryModelId;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Category({
        this.id,
        this.nameEn,
        this.nameAr,
        this.nameKu,
        this.mainCategoryModelId,
        this.createdAt,
        this.updatedAt,
    });

    Category copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? nameKu,
        int? mainCategoryModelId,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Category(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            nameKu: nameKu ?? this.nameKu,
            mainCategoryModelId: mainCategoryModelId ?? this.mainCategoryModelId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        nameKu: json["name_ku"],
        mainCategoryModelId: json["main_category_model_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "name_ku": nameKu,
        "main_category_model_id": mainCategoryModelId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class ProductImage {
    final int? id;
    final int? productId;
    final String? path;
    final String? colorEn;
    final String? colorAr;
    final String? colorKu;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    ProductImage({
        this.id,
        this.productId,
        this.path,
        this.colorEn,
        this.colorAr,
        this.colorKu,
        this.createdAt,
        this.updatedAt,
    });

    ProductImage copyWith({
        int? id,
        int? productId,
        String? path,
        String? colorEn,
        String? colorAr,
        String? colorKu,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        ProductImage(
            id: id ?? this.id,
            productId: productId ?? this.productId,
            path: path ?? this.path,
            colorEn: colorEn ?? this.colorEn,
            colorAr: colorAr ?? this.colorAr,
            colorKu: colorKu ?? this.colorKu,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory ProductImage.fromRawJson(String str) => ProductImage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        productId: json["product_id"],
        path: json["path"],
        colorEn: json["color_en"],
        colorAr: json["color_ar"],
        colorKu: json["color_ku"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "path": path,
        "color_en": colorEn,
        "color_ar": colorAr,
        "color_ku": colorKu,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Link {
    final String? url;
    final String? label;
    final bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    Link copyWith({
        String? url,
        String? label,
        bool? active,
    }) => 
        Link(
            url: url ?? this.url,
            label: label ?? this.label,
            active: active ?? this.active,
        );

    factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
