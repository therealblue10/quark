
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quark/global/brand_color/color.dart';
import 'package:quark/global/constant/strings/strings.dart';
import 'package:quark/modules/category/category_list.dart';
import 'package:quark/modules/category/category_store.dart';

class CategoryScene extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categoryStore = Provider.of<CategoryStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryLabel.screenTitle,
          style: Theme
              .of(context)
              .textTheme
              .subtitle2
              .copyWith(
              color: SecondaryColor.white
          ),),
      ),
      body: categoryStore.hasData ?
      buildList(context, categoryStore.superCategoryList):
      LinearProgressIndicator(
        backgroundColor: ThemeColor.primaryColor,
      )
    ) ;
  }

  Widget buildList(BuildContext context, List<Category> categories) {
    return SafeArea(
      top: false,
      child: Container(
          padding: EdgeInsets.only(left: 16, top: 22, right: 16),
          child: ListView.builder(itemBuilder: (context, index) {
            final category = categories[index];
            return InkWell(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(category.name,
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
              ),
            );
          },
          itemCount: categories.length,
          ),
      ),
    );
  }
}