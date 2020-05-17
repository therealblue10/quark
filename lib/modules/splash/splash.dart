import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:quark/modules/category/category_scene.dart';

class QuarkSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuarkSplashState();
}

class _QuarkSplashState extends State<QuarkSplash> {

var _isPaused = false;
final GlobalKey<ScaffoldState> _scaffoldKey =  
GlobalKey<ScaffoldState>();

@override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), didEndSplashAnimation);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            child: FlareActor('assets/animation/splash_animation.flr',
                isPaused: _isPaused,
                animation: 'Aura', fit: BoxFit.cover,
            ),
          ),
        ),
      );

  void didEndSplashAnimation() {
      // Go to home screen from here
      setState(() {
         _isPaused = true;
      });
      Navigator.pushReplacement(_scaffoldKey.currentContext, 
      MaterialPageRoute(builder: (context) => CategoryScene()),);
  }
}
