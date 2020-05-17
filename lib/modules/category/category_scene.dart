import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:quark/global/brand_color/color.dart';
import 'package:quark/global/constant/strings/strings.dart';
import 'package:quark/modules/category/category_list.dart';
import 'package:quark/modules/category/category_store.dart';
import 'package:quark/modules/product_category/product_category_scene.dart';
import 'package:quark/widget/widget.dart' as Widgets;

class CategoryScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryStore = Provider.of<CategoryStore>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            CategoryLabel.screenTitle,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(color: SecondaryColor.white),
          ),
        ),
        body: Observer(
          builder: (context) {
            return categoryStore.hasData
                ? buildList(context, categoryStore.superCategoryList)
                : LinearProgressIndicator(
                    backgroundColor: ThemeColor.primaryColor,
                  );
          },
        ));
  }

  Widget buildList(BuildContext context, List<Category> categories) {
    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 22, right: 16),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final category = categories[index];
            return InkWell(
              onTap: () {
                // Retrieve product-categories for the selected category
                final categoryStore =
                    Provider.of<CategoryStore>(context, listen: false);
                final productCategories =
                    categoryStore.filteredProductCategoryList(index);
                didSelectItemAt(context, productCategories);
              },
              child: Widgets.CategoryListItem(
                title: category.name,
              ),
            );
          },
          itemCount: categories.length,
        ),
      ),
    );
  }

  void didSelectItemAt(BuildContext context, List<Category> productCategories) {
    final categoryStore = Provider.of<CategoryStore>(context, listen: false);
    if (productCategories.length > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductCategoryScene(
                  productCategories: productCategories,
                  rankings: categoryStore.rankings,
                )),
      );
    }
  }
}
