// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductDataModel welcomeFromJson(String str) => ProductDataModel.fromJson(json.decode(str));

String welcomeToJson(ProductDataModel data) => json.encode(data.toJson());

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
    final Subcategory? subcategory;
    final Category? category;

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
        this.subcategory,
        this.category,
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
        Subcategory? subcategory,
        Category? category,
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
            subcategory: subcategory ?? this.subcategory,
            category: category ?? this.category,
        );

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
        subcategory: json["subcategory"] == null ? null : Subcategory.fromJson(json["subcategory"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
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
        "subcategory": subcategory?.toJson(),
        "category": category?.toJson(),
    };
}

class Category {
    final int? id;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Category({
        this.id,
        this.nameEn,
        this.nameAr,
        this.nameKu,
        this.createdAt,
        this.updatedAt,
    });

    Category copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? nameKu,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Category(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            nameKu: nameKu ?? this.nameKu,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        nameKu: json["name_ku"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "name_ku": nameKu,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Subcategory {
    final int? id;
    final int? categoryId;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final String? image;
    final String? backgroundImage;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Subcategory({
        this.id,
        this.categoryId,
        this.nameEn,
        this.nameAr,
        this.nameKu,
        this.image,
        this.backgroundImage,
        this.createdAt,
        this.updatedAt,
    });

    Subcategory copyWith({
        int? id,
        int? categoryId,
        String? nameEn,
        String? nameAr,
        String? nameKu,
        String? image,
        String? backgroundImage,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Subcategory(
            id: id ?? this.id,
            categoryId: categoryId ?? this.categoryId,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            nameKu: nameKu ?? this.nameKu,
            image: image ?? this.image,
            backgroundImage: backgroundImage ?? this.backgroundImage,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        categoryId: json["category_id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        nameKu: json["name_ku"],
        image: json["image"],
        backgroundImage: json["background_image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name_en": nameEn,
        "name_ar": nameAr,
        "name_ku": nameKu,
        "image": image,
        "background_image": backgroundImage,
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
