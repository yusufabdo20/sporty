import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../../services/local/cash.dart';
import '../../components/components.dart';
import '../SignUpScreen/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: rgbBahgaPurple1,
      // appBar: AppBar(
      //   title: const Text('SignUp Screen'),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      buildTextJost(
                        text: 'Sign In',
                        textColor: rgbBahgaPurple3,
                        textSize: 28,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      buildFormFieldText(
                        hintText: "email@bahga.com",
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter a valid email ';
                          }
                          // if (!RegExp(patterns[1]['emailPattern'])
                          //     .hasMatch(value)) {
                          //   return '     email must be like email@type.com';
                          // }
                        },
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            value = emailController.text;
                          }
                        },
                        controller: emailController,
                        labelText: "Email",
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      buildFormFieldText(
                          hintText: "* * * * * * * *",
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter a correct password ';
                            }
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              value = passwordController.text;
                            }
                          },
                          controller: passwordController,
                          labelText: "Password",
                          prefixIcon: Icons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          isSecure: isPassword,
                          suffix: isPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          }),
                      const SizedBox(
                        height: 15,
                      ),

                      //const SizedBox(height: 50),
                      buildElevatedTextButton(
                          onPressedFunction: () async {
                            // if (formKey.currentState!.validate()) {
                            //   email:
                            //   emailController.text;
                            //   password:
                            //   passwordController.text;
                            //   final userData = await SignInService().login(
                            //     emailController.text,
                            //     passwordController.text,
                            //   );

                            //   if (userData['code'] == 201) {
                            //     buildFlutterToast(
                            //         message: "Success",
                            //         state: ToastStates.SUCCESS);
                            //     Cash.saveData(
                            //             key: 'token',
                            //             value: userData['data']['token'])
                            //         .then((value) {
                            //       navigateTOAndReplacement(
                            //         context,
                            //         widget,
                            //       );
                            //     });
                            //     // setState(() {
                            //     //   navigateTOAndReplacement(
                            //     //     context,
                            //     //     const VerificationPhoneScreen(),
                            //     //   );
                            //     // });
                            //   } else {
                            //     buildFlutterToast(
                            //         message: "Your password is incorrect",
                            //         state: ToastStates.ERROR);
                            //     print("Your password is incorrect");
                            //   }
                            //   print(userData['data']['userData']['email']
                            //       .toString());
                            //   print(userData.toString());
                            // }
                          },
                          backgroundColor: rgbBahgaPurple3,
                          borderColor: rgbBahgaPurple3,
                          titleOfButton: "SIGN IN",
                          widthOfBorder: 2,
                          buttonWidth: double.infinity),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(height: 55),
              buildTextJost(
                  text: "One of us ?", textColor: Colors.black, textSize: 16),
              buildTextJost(
                  text:
                      "We have missed you a lot come to \n continue your jouney",
                  textColor: Colors.black,
                  textSize: 16),
              buildElevatedTextButton(
                  backgroundColor: rgbBahgaPurple3,
                  borderColor: rgbBahgaPurple3,
                  titleOfButton: "SIGN UP",
                  widthOfBorder: 2,
                  onPressedFunction: () {
                    setState(() {
                      navigateTO(context, SignUpScreen());
                    });
                  }),
            ])
          ],
        ),
      ),
    );
  }
}
