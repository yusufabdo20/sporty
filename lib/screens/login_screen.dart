import 'package:flutter/material.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/screens/signup_screen.dart';
import 'package:sporty/widgets/custom_button.dart';
import 'package:sporty/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                klogo,
                width: 500,
                height: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomformTextField(
                hintText: 'E-mail',
                label: Text('E-mail'),
                prefixIcon: Icon(Icons.email),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomformTextField(
                hintText: 'Password',
                obsecureText: true,
                label: Text('Password'),
                prefixIcon: Icon(Icons.password_rounded),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onTap: () {},
                buttonTo: 'Sign In',
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an Acount?',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                    child: const Text(
                      'Sign-Up',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
