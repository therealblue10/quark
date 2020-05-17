import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quark/global/brand_color/color.dart';
import 'package:quark/global/constant/strings/strings.dart';
import 'package:quark/modules/category/category_list.dart';
import 'package:quark/modules/product/product_scene.dart';
import 'package:quark/modules/product/product_store.dart';
import 'package:quark/widget/widget.dart' as Widgets;

class ProductCategoryScene extends StatelessWidget {

  ProductCategoryScene({Key key,
    @required this.productCategories, this.rankings}):
        super(key: key);

  final List<Category> productCategories;
  final List<Ranking> rankings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(ProductCategoryLabel.screenTitle,
            style: Theme
                .of(context)
                .textTheme
                .subtitle2
                .copyWith(
                color: SecondaryColor.white
            ),),
        ),
        body: buildList(context, this.productCategories)
    );
  }

  Widget buildList(BuildContext context, List<Category> categories) {
    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 22, right: 16),
        child: ListView.builder(itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: () {
              didSelectItemAt(context, category.products);
            },
            child: Widgets.CategoryListItem(
              title: category.name,
            )
          );
        },
          itemCount: categories.length,
        ),
      ),
    );
  }

  void didSelectItemAt(BuildContext context, List<Product> products) {
    if (products.length > 0) {
      final productStore        = Provider.of<ProductStore>(context, listen: false);
      productStore.rankings     = this.rankings;
      productStore.allProducts  = products;
      productStore.sortBy(RankType.byViews);
      Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            ProductScene()),);
    }
  }

}