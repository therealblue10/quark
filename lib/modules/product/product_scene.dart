import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:quark/global/brand_color/color.dart';
import 'package:quark/global/constant/strings/strings.dart';
import 'package:quark/modules/category/category_list.dart';
import 'package:quark/modules/product/product_store.dart';
import 'package:quark/modules/product/product_widgets.dart' as Widgets;

class ProductScene extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productStore = Provider.of<ProductStore>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(ProductLabel.screenTitle,
            style: Theme
                .of(context)
                .textTheme
                .subtitle2
                .copyWith(
                color: SecondaryColor.white
            ),),
        ),
        body: Observer(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildSortOptions(context),
              buildList(context, productStore.sortedProducts)
            ],
          ),
        )
    );
  }

  Widget buildSortOptions(BuildContext context) {
    final productStore = Provider.of<ProductStore>(context);
    return Container(
          padding: EdgeInsets.only(left: 16, top: 16),
          child: DropdownButton<String>(
            value: productStore.selectedRankingType,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            onChanged: (String newValue) {
              productStore.didChangeSortOption(newValue);
            },
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                fontSize: 14,
                color: SecondaryColor.darkGray
            ),
            items: <String>[SortingTypeLabel.byViews, SortingTypeLabel.byOrder, SortingTypeLabel.byShare]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: Theme.of(context).
                textTheme.subtitle2.copyWith(
                    fontSize: 14,
                    color: SecondaryColor.darkGray
                )),
              );
            }).toList(),
          ),
    );
  }

  Widget buildList(BuildContext context, List<Product> products) {
    return SafeArea(
      top: false,
      child: Container(
        height: MediaQuery.of(context).size.height-200,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 16, top: 22, right: 16),
        child: ListView.builder(itemBuilder: (context, index) {
          final product = products[index];
          return InkWell(
              child: Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(product.name,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontSize: 18,
                              color: SecondaryColor.lightBlack
                          ),),
                        Widgets.ProductVariant(
                          product: product,
                        ),
                      ],
                    ),
                  ),
                ),
              )
          );
        },
          itemCount: products.length,
        ),
      ),
    );
  }

}

