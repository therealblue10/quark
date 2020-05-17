
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quark/global/brand_color/color.dart';

class CategoryListItem extends StatelessWidget {

  CategoryListItem({Key key,
    @required this.title}):
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                  fontSize: 18,
                  color: SecondaryColor.lightBlack
              ),),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: SecondaryColor.lightGray,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          height: 60,
        ),
      ],
    );
  }
}