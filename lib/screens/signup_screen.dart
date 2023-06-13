import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sporty/constanse.dart';
import 'package:sporty/cubit/auth_cubit/auth_cubit.dart';
import 'package:sporty/helper/show-snack-bar.dart';
import 'package:sporty/services/network/authServices.dart';
import 'package:sporty/widgets/custom_button.dart';
import 'package:sporty/widgets/custom_image_list.dart';
import 'package:sporty/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static String id = 'Signup screen';
  bool isLoading = false;
  String? name, email, password, password_confirmation;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegistrLoading) {
          isLoading = true;
        } else if (state is RegistrSuccess) {
          Navigator.pop(context);
          isLoading = false;
        } else if (state is RegistrFailure) {
          scafoldmassage(context, state.errMassage);
          isLoading = false;
        }
      },
      builder: (context, State) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
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
                    onChange: (v) {
                      name = v;
                    },
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  CustomformTextField(
                    hintText: 'E-mail',
                    label: const Text('E-mail'),
                    prefixIcon: const Icon(Icons.email),
                    onChange: (v) {
                      email = v;
                    },
                  ),
                  const SizedBox(
                    height: 6,
                  ),

                  CustomformTextField(
                    hintText: 'Password',
                    label: const Text('Password'),
                    prefixIcon: const Icon(Icons.password_rounded),
                    onChange: (v) {
                      password = v;
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomformTextField(
                    hintText: 'confirm your Password',
                    obsecureText: true,
                    label: const Text('confirm Password'),
                    prefixIcon: const Icon(Icons.password_rounded),
                    onChange: (value) {
                      if (password != value) {
                        return "The password isn't correct";
                      } else {
                        password_confirmation = value;
                        return null;
                      }
                    },
                  ),
                  const ImagesListView(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onTap: () async {
                      BlocProvider.of<AuthCubit>(context).registerUser(
                          email: email!,
                          password: password_confirmation!,
                          name: name!, );
                      Navigator.pop(context);
                    },
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
        ),
      ),
    );
  }
}
