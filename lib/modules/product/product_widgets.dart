
import 'package:flutter/material.dart';
import 'package:quark/global/brand_color/color.dart';
import 'package:quark/global/constant/strings/strings.dart';
import 'package:quark/modules/category/category_list.dart';

class ProductVariant extends StatelessWidget {

  ProductVariant({Key key,
    @required this.product}):
        super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        height: 110,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: ThemeColor.accentColor
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(ProductLabel.variant,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(
                        fontSize: 14,
                        color: SecondaryColor.randiantRed
                    ),),
                  Align(
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: SecondaryColor.randiantRed,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ProductAttribute(
                    attribute: ProductLabel.color,
                    value: product.variants.first.color,
                  ),
                  ProductAttribute(
                    attribute: ProductLabel.size,
                    value: '${product.variants.first.size}',
                  ),
                  ProductAttribute(
                    attribute: ProductLabel.price,
                    value: '${product.variants.first.price}',
                  )
                ],
              )
            ],
          ),
        ),
      )
      ,
    );
  }

}


class ProductAttribute extends StatelessWidget {

  ProductAttribute({Key key,
    @required this.attribute, @required this.value}):
        super(key: key);

  final String attribute;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      height: 45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(attribute,
            style: Theme.of(context).textTheme.caption.copyWith(
                fontSize: 14,
                color: SecondaryColor.darkGray
            ),),
          Text(value,
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                fontSize: 14,
                color: SecondaryColor.lightBlack
            ),),
        ],
      ),
    );
  }

}