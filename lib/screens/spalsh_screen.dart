import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            klogo,
          ),
          const Text(
            'Let\'s Sport',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
      splashIconSize: 400,
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.slideTransition,
      duration: 3000,
      animationDuration: const Duration(milliseconds: 2000),
    );
  }
}
