import 'package:flutter/material.dart';
import 'package:quark/global/brand_color/color.dart';
import 'package:quark/global/font_family/font_family.dart';


final ThemeData lightTheme = buildTheme();

ThemeData buildTheme() {
  final theme = ThemeData();
  return theme.copyWith(
      accentColor: ThemeColor.accentColor,
      primaryColor: ThemeColor.primaryColor,
      buttonColor: SecondaryColor.lightBlack,
      errorColor: SecondaryColor.randiantRed,
      textTheme: _buildAppTextTheme(
          theme.textTheme, BrandFontFamily.primaryFont, ThemeColor.primaryColor),
      primaryTextTheme: _buildAppTextTheme(theme.primaryTextTheme,
          BrandFontFamily.primaryFont, SecondaryColor.darkGray),
      accentTextTheme: _buildAppTextTheme(theme.accentTextTheme,
          BrandFontFamily.primaryFont, ThemeColor.accentColor));
}

TextTheme _buildAppTextTheme(
        TextTheme base, String fontFamily, Color textColor) =>
    TextTheme(
      headline5: base.headline5.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w700,
      ),
      subtitle1: base.subtitle1.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.w600,
      ),
      headline6: base.headline6.copyWith(
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: base.subtitle2.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      caption: base.caption.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w200,
      ),
    ).apply(
      fontFamily: fontFamily,
      displayColor: textColor,
      bodyColor: textColor,
    );