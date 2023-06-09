import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sporty/screens/chat_screen.dart';
import 'package:sporty/screens/create_event_sceen.dart';
import 'package:sporty/screens/home_screen.dart';
import 'package:sporty/screens/joined_envent_screen.dart';
import 'package:sporty/screens/login_screen.dart';
import 'package:sporty/screens/profile_screen.dart';
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
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        MyProfileScreen.id: (context) => const MyProfileScreen(),
        MyJoinedScreen.id: (context) => const MyJoinedScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
        CreateEventScreen.id: (context) => const CreateEventScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
