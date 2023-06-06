import 'package:flutter/material.dart';
import 'package:sporty/screens/login_screen.dart';
import 'package:sporty/widgets/custom_button.dart';
import 'package:sporty/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static String id = 'Signup screen';

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
                'assets/images/logo.png',
                width: 500,
                height: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome! Let\'s Creat Your Sporty Account',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomformTextField(
                hintText: 'E-mail',
                 label: Text('E-mail'),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomformTextField(
                hintText: 'Password',
                label: Text('Password'),
              ),
              const SizedBox(
                height: 7,
              ),
              CustomformTextField(
                hintText: 'confirm your Password',
                obsecureText: true,
                label: Text('confirm Password'),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onTap: () {},
                buttonTo: 'Sign up',
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'have an Acount?',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
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
