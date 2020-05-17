
import 'package:flutter/material.dart';
import 'package:quark/global/brand_color/color.dart';
import 'package:quark/global/constant/strings/strings.dart';

class CategoryScene extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(CategoryLabel.screenTitle, 
      style: Theme.of(context).textTheme.subtitle2.copyWith(
        color: SecondaryColor.white
      ),),
    ),
    body: Container(    
    ),);

}