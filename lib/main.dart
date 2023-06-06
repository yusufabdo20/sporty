import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sporty/screens/login_screen.dart';
import 'package:sporty/screens/signup_screen.dart';
import 'package:sporty/screens/spalsh_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sporty App',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
