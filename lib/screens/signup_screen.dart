import 'package:flutter/material.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/widgets/custom_button.dart';
import 'package:sporty/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static String id = 'Signup screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Image.asset(
                klogo,
                width: 240,
                // height: 200,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Welcome! Let\'s Creat Your Sporty Account',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomformTextField(
                hintText: 'User Name',
                label: const Text('User Name'),
                prefixIcon: const Icon(Icons.person_pin),
              ),
              const SizedBox(
                height: 6,
              ),
              CustomformTextField(
                hintText: 'E-mail',
                label: const Text('E-mail'),
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(
                height: 6,
              ),

              CustomformTextField(
                hintText: 'Password',
                label: const Text('Password'),
                prefixIcon: const Icon(Icons.password_rounded),
              ),
              const SizedBox(
                height: 7,
              ),
              CustomformTextField(
                hintText: 'confirm your Password',
                obsecureText: true,
                label: const Text('confirm Password'),
                prefixIcon: const Icon(Icons.password_rounded),
              ),
              const SizedBox(
                height: 7,
              ),
              GestureDetector(
                onTap: () {},
                child: CustomformTextField(
                  hintText: 'Pick Up your Image',
                  label: const Text('Photo'),
                  prefixIcon: GestureDetector(
                      onTap: () {}, child: const Icon(Icons.photo)),
                  // suffix:,
                ),
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
                height: 6,
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
