import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quark/global/app_theme/app_theme.dart';
import 'package:quark/modules/category/category_store.dart';
import 'package:quark/modules/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:  [
        Provider<CategoryStore>(create: (_) => CategoryStore(), lazy: false,),
      ],
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: QuarkSplash(),
      ),
    );
  }
}


