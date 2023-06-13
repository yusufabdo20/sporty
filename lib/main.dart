import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporty/cubit/auth_cubit/auth_cubit.dart';
import 'package:sporty/cubit/event_cubit/event_cubit.dart';
import 'package:sporty/cubit/message_cubit/message_cubit.dart';
import 'package:sporty/cubit/user_cubit/user_cubit.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => EventCubit()),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => UserCubit()),
          BlocProvider(create: (context) => MessageCubit()),
        ],
        child: MaterialApp(
          title: 'Sporty App',
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          routes: {
            SplashScreen.id: (context) => const SplashScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            SignUpScreen.id: (context) => SignUpScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            MyProfileScreen.id: (context) => MyProfileScreen(),
            MyJoinedScreen.id: (context) => MyJoinedScreen(),
            ChatScreen.id: (context) => ChatScreen(),
            CreateEventScreen.id: (context) => CreateEventScreen(),
          },
          initialRoute: SplashScreen.id,
        ));
  }
}
