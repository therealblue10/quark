import 'package:flutter/material.dart';
import 'package:quark/global/brand_color/color.dart';
import 'package:quark/global/constant/strings/strings.dart';
import 'package:quark/modules/category/category_list.dart';
import 'package:quark/modules/product/product_widgets.dart' as Widgets;

class ProductVariantScene extends StatelessWidget {

  ProductVariantScene({Key key,
    @required this.product, }):
        super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(ProductLabel.variant,
            style: Theme
                .of(context)
                .textTheme
                .subtitle2
                .copyWith(
                color: SecondaryColor.white
            ),),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(product.name,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontSize: 18,
                    color: SecondaryColor.lightBlack
                ),),
            ),
            buildList(context, product.variants),
          ],
        )
    );
  }


  Widget buildList(BuildContext context, List<Variant> variants) {
    return SafeArea(
      top: false,
      child: Container(
        height: MediaQuery.of(context).size.height-180,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 16, top: 22, right: 16),
        child: ListView.builder(itemBuilder: (context, index) {
          final variant = variants[index];
          return InkWell(
              child: Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 145,
                    child: Widgets.ProductVariant(
                      showVariantDropdown: false,
                      variant: variant,
                    ),
                  ),
                ),
              )
          );
        },
          itemCount: variants.length,
        ),
      ),
    );
  }

}

