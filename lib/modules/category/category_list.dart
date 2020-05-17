
import 'package:flutter/material.dart';

class CategoryList {
    List<Category> categories;
    List<Ranking> rankings;

    CategoryList({this.categories, this.rankings});

    factory CategoryList.fromJson(Map<String, dynamic> json) {
        return CategoryList(
            categories: json['categories'] != null ? (json['categories'] as List).map((i) => Category.fromJson(i)).toList() : null, 
            rankings: json['rankings'] != null ? (json['rankings'] as List).map((i) => Ranking.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.categories != null) {
            data['categories'] = this.categories.map((v) => v.toJson()).toList();
        }
        if (this.rankings != null) {
            data['rankings'] = this.rankings.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Category {
    List<int> childCategories;
    int id;
    String name;
    List<Product> products;

    Category({this.childCategories, this.id, this.name, this.products});

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            childCategories: json['child_categories'] != null ? new List<int>.from(json['child_categories']) : null,
            id: json['id'],
            name: json['name'],
            products: json['products'] != null ? (json['products'] as List).map((i) => Product.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        if (this.childCategories != null) {
            data['child_categories'] = this.childCategories;
        }
        if (this.products != null) {
            data['products'] = this.products.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Product {
    String dateAdded;
    int id;
    String name;
    Tax tax;
    List<Variant> variants;

    Product({this.dateAdded, this.id, this.name, this.tax, this.variants});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            dateAdded: json['date_added'],
            id: json['id'],
            name: json['name'],
            tax: json['tax'] != null ? Tax.fromJson(json['tax']) : null,
            variants: json['variants'] != null ? (json['variants'] as List).map((i) => Variant.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date_added'] = this.dateAdded;
        data['id'] = this.id;
        data['name'] = this.name;
        if (this.tax != null) {
            data['tax'] = this.tax.toJson();
        }
        if (this.variants != null) {
            data['variants'] = this.variants.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Tax {
    String name;
    double value;

    Tax({this.name, this.value});

    factory Tax.fromJson(Map<String, dynamic> json) {
        return Tax(
            name: json['name'],
            value: (json['value'] + .0),
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['value'] = this.value;
        return data;
    }
}

class Variant {
    String color;
    int id;
    int price;
    int size;

    Variant({this.color, this.id, this.price, this.size});

    factory Variant.fromJson(Map<String, dynamic> json) {
        return Variant(
            color: json['color'],
            id: json['id'],
            price: json['price'],
            size: json['size'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['color'] = this.color;
        data['id'] = this.id;
        data['price'] = this.price;
        data['size'] = this.size;
        return data;
    }
}


class Ranking {
    List<RankedProduct> products;
    String ranking;
    RankType type;

    Ranking({this.products, this.ranking, this.type});

    factory Ranking.fromJson(Map<String, dynamic> json) {
        final rankings = json['products'];
        List<RankedProduct> productList;
        if(rankings != null) {
            var rankedProducts = json['products'] as List;
            var products = rankedProducts.map((element) {
                final ranking  = element['view_count'] ??
                    (element['order_count'] ?? element['shares']);
                return RankedProduct(id: element['id'],
                    ranking: ranking);
            });

            productList = products.toList();
        }
        final ranking =  json['ranking'];
        var rankType  = RankType.byViews;
        if(ranking == 'Most ShaRed Products') {
            rankType = RankType.byShare;
        } else if (ranking == 'Most OrdeRed Products') {
            rankType = RankType.byOrder;
        }
        return Ranking(
            products: productList,
            ranking: ranking,
            type: rankType,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ranking'] = this.ranking;
        if (this.products != null) {
            data['products'] = this.products.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class RankedProduct {
    int id;
    int ranking;
    RankedProduct({this.id, this.ranking});

    factory RankedProduct.fromJson(Map<String, dynamic> json) {
        return RankedProduct(
            id: json['id'],
            ranking: json['ranking']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['ranking'] = this.ranking;
        return data;
    }
}

enum RankType {
    byViews,
    byShare,
    byOrder
}