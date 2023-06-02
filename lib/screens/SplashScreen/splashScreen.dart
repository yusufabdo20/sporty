import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../onBoardindScreen/onBordingScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image(
            image: AssetImage('assets/images/LogoMakr-5tcZOW.png'),
            width: 100,
            height: 100,
          ),
          Text(
            "BAHGA",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Color(0xff5961F9),
      nextScreen: OnBoardingScreen(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: Duration(seconds: 1),
    );
  }
}
