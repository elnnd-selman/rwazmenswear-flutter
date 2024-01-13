import 'dart:convert';

class CategoryDataModel {
    final int? currentPage;
    final List<CategoryModel>? data;
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

    CategoryDataModel({
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

    CategoryDataModel copyWith({
        int? currentPage,
        List<CategoryModel>? data,
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
        CategoryDataModel(
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

    factory CategoryDataModel.fromRawJson(String str) => CategoryDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoryDataModel.fromJson(Map<String, dynamic> json) => CategoryDataModel(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<CategoryModel>.from(json["data"]!.map((x) => CategoryModel.fromJson(x))),
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

class CategoryModel {
    final int? id;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<SubcategoryModel>? subcategories;

    CategoryModel({
        this.id,
        this.nameEn,
        this.nameAr,
        this.nameKu,
        this.createdAt,
        this.updatedAt,
        this.subcategories,
    });

    CategoryModel copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? nameKu,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<SubcategoryModel>? subcategories,
    }) => 
        CategoryModel(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            nameKu: nameKu ?? this.nameKu,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            subcategories: subcategories ?? this.subcategories,
        );

    factory CategoryModel.fromRawJson(String str) => CategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        nameKu: json["name_ku"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        subcategories: json["subcategories"] == null ? [] : List<SubcategoryModel>.from(json["subcategories"]!.map((x) => SubcategoryModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "name_ku": nameKu,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "subcategories": subcategories == null ? [] : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
    };
}

class SubcategoryModel {
    final int? id;
    final int? categoryId;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final String? image;
    final String? backgroundImage;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    SubcategoryModel({
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

    SubcategoryModel copyWith({
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
        SubcategoryModel(
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

    factory SubcategoryModel.fromRawJson(String str) => SubcategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubcategoryModel.fromJson(Map<String, dynamic> json) => SubcategoryModel(
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
