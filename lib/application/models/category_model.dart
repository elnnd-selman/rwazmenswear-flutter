import 'dart:convert';

class MainCategoryModel {
    final int? id;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<CategoryModel>? categories;

    MainCategoryModel({
        this.id,
        this.nameEn,
        this.nameAr,
        this.nameKu,
        this.createdAt,
        this.updatedAt,
        this.categories,
    });

    MainCategoryModel copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? nameKu,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<CategoryModel>? categories,
    }) => 
        MainCategoryModel(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            nameKu: nameKu ?? this.nameKu,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            categories: categories ?? this.categories,
        );

    factory MainCategoryModel.fromRawJson(String str) => MainCategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MainCategoryModel.fromJson(Map<String, dynamic> json) => MainCategoryModel(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        nameKu: json["name_ku"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        categories: json["categories"] == null ? [] : List<CategoryModel>.from(json["categories"]!.map((x) => CategoryModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "name_ku": nameKu,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class CategoryModel {
    final int? id;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final int? mainCategoryModelsId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<SubCategoryModel>? subCategories;
    final int? mainCategoryModelId;

    CategoryModel({
        this.id,
        this.nameEn,
        this.nameAr,
        this.nameKu,
        this.mainCategoryModelsId,
        this.createdAt,
        this.updatedAt,
        this.subCategories,
        this.mainCategoryModelId,
    });

    CategoryModel copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? nameKu,
        int? mainCategoryModelsId,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<SubCategoryModel>? subCategories,
        int? mainCategoryModelId,
    }) => 
        CategoryModel(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            nameKu: nameKu ?? this.nameKu,
            mainCategoryModelsId: mainCategoryModelsId ?? this.mainCategoryModelsId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            subCategories: subCategories ?? this.subCategories,
            mainCategoryModelId: mainCategoryModelId ?? this.mainCategoryModelId,
        );

    factory CategoryModel.fromRawJson(String str) => CategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        nameKu: json["name_ku"],
        mainCategoryModelsId: json["main_category_models_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        subCategories: json["sub_categories"] == null ? [] : List<SubCategoryModel>.from(json["sub_categories"]!.map((x) => SubCategoryModel.fromJson(x))),
        mainCategoryModelId: json["main_category_model_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "name_ku": nameKu,
        "main_category_models_id": mainCategoryModelsId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "sub_categories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
        "main_category_model_id": mainCategoryModelId,
    };
}

class SubCategoryModel {
    final int? id;
    final int? categoryId;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final String? image;
    final String? backgroundImage;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    SubCategoryModel({
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

    SubCategoryModel copyWith({
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
        SubCategoryModel(
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

    factory SubCategoryModel.fromRawJson(String str) => SubCategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
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
