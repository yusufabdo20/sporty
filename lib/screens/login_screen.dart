import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/auth_cubit/auth_cubit.dart';
import 'package:sporty/cubit/event_cubit/event_cubit.dart';
import 'package:sporty/helper/show-snack-bar.dart';
import 'package:sporty/screens/home_screen.dart';
import 'package:sporty/screens/signup_screen.dart';
import 'package:sporty/widgets/custom_button.dart';
import 'package:sporty/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String id = 'LoginPage';
  String? password;
  late String email = '';
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          print('moooooooooooooooooooooo');
          Navigator.pushNamed(context, HomeScreen.id, arguments: email);
          isLoading = false;
        } else if (state is LoginFailure) {
          scafoldmassage(context, state.errMassage);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
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
                        label: const Text('E-mail'),
                        prefixIcon: const Icon(Icons.email),
                        onChange: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomformTextField(
                        hintText: 'Password',
                        obsecureText: true,
                        label: const Text('Password'),
                        prefixIcon: const Icon(Icons.password_rounded),
                        onChange: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .loginUser(email: email!, password: password!);
                          } else {}
                        },
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
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
