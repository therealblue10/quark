
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
    int id;
    int shares;

    Product({this.id, this.shares});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            id: json['id'],
            shares: json['shares'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['shares'] = this.shares;
        return data;
    }
}

class Ranking {
    List<Product> products;
    String ranking;

    Ranking({this.products, this.ranking});

    factory Ranking.fromJson(Map<String, dynamic> json) {
        return Ranking(
            products: json['products'] != null ? (json['products'] as List).map((i) => Product.fromJson(i)).toList() : null,
            ranking: json['ranking'],
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