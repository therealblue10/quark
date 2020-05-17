import 'package:flutter/material.dart';
import 'package:quark/global/brand_color/color.dart';
import 'package:quark/global/constant/strings/strings.dart';
import 'package:quark/modules/category/category_list.dart';
import 'package:quark/modules/product/product_widgets.dart' as Widgets;

class ProductScene extends StatelessWidget {

  ProductScene({Key key,
    @required this.products}):
        super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
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
        body: buildList(context, this.products)
    );
  }

  Widget buildList(BuildContext context, List<Product> products) {
    return SafeArea(
      top: false,
      child: Container(
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

