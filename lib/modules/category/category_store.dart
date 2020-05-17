import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:quark/global/constant/url_endpoints/url_endpoints.dart'
as QuarkURL;
import 'package:quark/global/service/network_request/url_request_client.dart';
import 'package:quark/modules/category/category_list.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  final httpClient = URLRequestClient(QuarkURL.BaseURL.heroku);

  _CategoryStore() {
    fetchProducts();
  }

  @observable
  bool hasData = false;

  @observable
  CategoryList allCategoryList;

  @observable
  List<Category> superCategoryList;

  @observable
  List<Category> productCategoryList;

  // Filter product-categories list for selected category
  @action
  List<Category> filteredProductCategoryList(int index) {
    final selectedCategory =  this.superCategoryList[index];

    // Get subcategories for this category
    final productCategoriesIds = selectedCategory.childCategories;
    List<Category> productCategories = [];
    for (int uid in productCategoriesIds) {
      final categories =  (this.productCategoryList.where((category)
      => category.id == uid)).toList();
      if (categories.length > 0) {
        productCategories.add(categories.first);
      }
    }
    return productCategories;
  }

  @action
  fetchProducts() {
    httpClient.getResponse().then((categoryList) {
        this.allCategoryList = CategoryList.fromJson(categoryList);

        // Filter super categories such as Men's Wear
        this.superCategoryList =
        (this.allCategoryList.categories.where((category)
            => category.childCategories.length > 0)).toList();

        // Filter sub categories such as Jeans, T-Shirts in Men's Wear
        this.productCategoryList =
        (this.allCategoryList.categories.where((category)
            => category.childCategories.length == 0)).toList();

        // When data is available to be displayed
        this.hasData = (this.allCategoryList.categories.length ?? 0) > 0;

    }).catchError( (error) => error);
  }
 
}