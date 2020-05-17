import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class QuarkSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuarkSplashState();
}

class _QuarkSplashState extends State<QuarkSplash> {

var _isPaused = false;

@override
  void initState() {
    super.initState();
    print('Init state');
    Future.delayed(Duration(seconds: 3), didEndSplashAnimation);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
      print('Splash enaimation ended');
      setState(() {
         _isPaused = true;
      });
  }
}
