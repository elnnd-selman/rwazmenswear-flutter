// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RekDataModel welcomeFromJson(String str) => RekDataModel.fromJson(json.decode(str));

String welcomeToJson(RekDataModel data) => json.encode(data.toJson());

class RekDataModel {
    final int? currentPage;
    final List<ReklamModel>? data;
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

    RekDataModel({
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

    RekDataModel copyWith({
        int? currentPage,
        List<ReklamModel>? data,
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
        RekDataModel(
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

    factory RekDataModel.fromJson(Map<String, dynamic> json) => RekDataModel(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<ReklamModel>.from(json["data"]!.map((x) => ReklamModel.fromJson(x))),
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

class ReklamModel {
    final int? id;
    final String? nameEn;
    final String? nameAr;
    final String? nameKu;
    final String? contentEn;
    final String? contentAr;
    final String? contentKu;
    final String? productLink;
    final String? image;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    ReklamModel({
        this.id,
        this.nameEn,
        this.nameAr,
        this.nameKu,
        this.contentEn,
        this.contentAr,
        this.contentKu,
        this.productLink,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    ReklamModel copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? nameKu,
        String? contentEn,
        String? contentAr,
        String? contentKu,
        String? productLink,
        String? image,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        ReklamModel(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            nameKu: nameKu ?? this.nameKu,
            contentEn: contentEn ?? this.contentEn,
            contentAr: contentAr ?? this.contentAr,
            contentKu: contentKu ?? this.contentKu,
            productLink: productLink ?? this.productLink,
            image: image ?? this.image,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory ReklamModel.fromJson(Map<String, dynamic> json) => ReklamModel(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        nameKu: json["name_ku"],
        contentEn: json["content_en"],
        contentAr: json["content_ar"],
        contentKu: json["content_ku"],
        productLink: json["product_link"],
        image: json["image"],
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
        "product_link": productLink,
        "image": image,
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
