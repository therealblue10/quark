import 'package:mobx/mobx.dart';
import 'package:quark/global/constant/strings/strings.dart';
import 'package:quark/modules/category/category_list.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {

  @observable
  String selectedRankingType = SortingTypeLabel.byViews;

  @observable
  List<String> rankingTypes = [SortingTypeLabel.byViews, SortingTypeLabel.byShare,
    SortingTypeLabel.byOrder];

  @observable
  List<Product> allProducts;

  @observable
  List<Product> sortedProducts = [];

  @observable
  List<Ranking> rankings;

  @action
  void sortBy(RankType type) {
      // Sort products based on selected type
      var selectedRanking = (this.rankings.where((element) =>
      element.type == type)).toList();
      final rankedProductTypes =  selectedRanking.first.products;
      rankedProductTypes.sort((element1, element2) =>
      (element1.ranking > element2.ranking ? 1 : 0));
      List<Product> sortedProducts = [];
      rankedProductTypes.forEach((element) {
          final products = (this.allProducts.where((product) =>
          element.id == product.id)).toList();
          if (products.length > 0 && products.first != null) {
            sortedProducts.add(products.first);
          }
      });
      this.sortedProducts = sortedProducts;

      // Since all of the products aren't available in JSON Data.
      // We'll add the missing ones at the end
      final Set<Product> allProductsSet   = Set.from(this.allProducts);
      final Set<Product> sortedProductSet = Set.from(this.sortedProducts);
      final difference       =  allProductsSet.difference(sortedProductSet);
      if (difference.length > 0) {
         this.sortedProducts.addAll(difference.toList());
      }
  }

  @action
  void didChangeSortOption(String type) {
    this.selectedRankingType = type;
    final index = this.rankingTypes.indexOf(type);
    final sortType = RankType.values[index];
    sortBy(sortType);
  }
}