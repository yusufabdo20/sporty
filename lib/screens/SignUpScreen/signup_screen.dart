import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../components/constants.dart';
import '../../services/local/cash.dart';
import '../SignInScreen/signin_screen.dart';

// import 'package:hexcolor/hexcolor.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  static String id = 'sign up screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  var mobilePhoneController = TextEditingController();
  var birthDateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isPassword2 = true;
  _validation({required value, required String msg}) {
    if (value.isEmpty) {
      return msg;
    }
  }

  late var checkPasswordCorrect;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: rgbBahgaPurple1,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(backgroundImage3), fit: BoxFit.cover)
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          buildTextJost(
                            text: 'Sign Up',
                            textColor: rgbBahgaPurple3,
                            textSize: 28,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildFormFieldText(
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Please Enter username";
                              }
                            },
                            controller: usernameController,
                            labelText: "Username",
                            prefixIcon: Icons.person,
                            keyboardType: TextInputType.text,
                            hintText: "Enter a username",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Please Enter email";
                              }

                              if (!RegExp(patterns[1]['emailPattern'])
                                  .hasMatch(value)) {
                                return "Please Enter a valid email address.";
                              }
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                value = emailController.text;
                              }
                            },
                            onChange: (value) {
                              if (formKey.currentState!.validate()) {
                                value = emailController.text;
                              }
                            },
                            controller: emailController,
                            labelText: "Email",
                            hintText: "Enter new email address",
                            prefixIcon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                            hintText: "0123456789",
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'please enter a valid mobile phone ';
                              }
                              if (!RegExp(patterns[0]['phonePattern'])
                                  .hasMatch(value)) {
                                return 'please enter a valid 11 numbers of your phone \n and Start with 01xxxxxxxxx';
                              }
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                value = mobilePhoneController.text;
                              }
                            },
                            onChange: (value) {
                              if (formKey.currentState!.validate()) {
                                value = mobilePhoneController.text;
                              }
                            },
                            controller: mobilePhoneController,
                            labelText: "Mobile Phone",
                            prefixIcon: Icons.phone_android_outlined,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          buildFormFieldText(
                              hintText: "* * * * * * * *",
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'please enter a valid password ';
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
                          buildFormFieldText(
                              // validate: (value) {
                              //   if (value.isEmpty) {
                              //     return 'Must not Empty';
                              //   }

                              //   if (value != checkPasswordCorrect) {
                              //     return 'not correct password';
                              //   }
                              // },
                            
                              onChange: (value) {
                                if (formKey.currentState!.validate()) {
                                  value = passwordController2.text;
                                }
                              },
                              controller: passwordController2,
                              labelText: "Confirm Password",
                              hintText: "* * * * * * * *",
                              prefixIcon: Icons.lock,
                              keyboardType: TextInputType.visiblePassword,
                              isSecure: isPassword2,
                              suffix: isPassword2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              suffixPressed: () {
                                setState(() {
                                  isPassword2 = !isPassword2;
                                });
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                    
                          Container(
                            width: double.infinity,
                            child: buildElevatedTextButton(
                              onPressedFunction: () async {
                                try {
                                  // if (formKey.currentState!.validate()) {
                                  //   email:
                                  //   emailController.text;
                                  //   password:
                                  //   passwordController.text;
                                  //   var userDataSignUp =
                                  //       await SignUpService().register(
                                  //     email: emailController.text,
                                  //     password: passwordController2.text,
                                  //     name: usernameController.text,
                                  //     mobile: mobilePhoneController.text,
                                  //     birthDate: birthDateController.text,
                                  //   );
                                  //   if (userDataSignUp['code'] == 201) {
                                  //     buildFlutterToast(
                                  //         message:
                                  //             "Thank you for your Registration",
                                  //         state: ToastStates.SUCCESS);
                                  //     Cash.saveData(
                                  //       key: 'token',
                                  //       value: userDataSignUp['data']['token'],
                                  //     ).then((value) {
                                  //       navigateTOAndReplacement(
                                  //           context, widget);
                                  //     });
                                  //   } else {
                                  //     buildFlutterToast(
                                  //         message:
                                  //             "${userDataSignUp['data']['password']}",
                                  //         state: ToastStates.ERROR);
                                  //   }
                                  //   print(userDataSignUp.toString());
                                  // }
                                } catch (e) {
                                  print("rror in Register Method ++>> $e");
                                }
                              },
                              backgroundColor: rgbBahgaPurple3,
                              borderColor: rgbBahgaPurple3,
                              titleOfButton: "SIGN UP",
                              widthOfBorder: 2,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    buildTextJost(
                        text: "One of us ?",
                        textColor: Colors.white,
                        textSize: 16),
                    buildTextJost(
                        text:
                            "We have missed you a lot come to \n continue your jouney",
                        textColor: Colors.white,
                        textSize: 16),
                    buildElevatedTextButton(
                        backgroundColor: rgbBahgaPurple3,
                        borderColor: rgbBahgaPurple3,
                        titleOfButton: "SIGN IN",
                        widthOfBorder: 2,
                        onPressedFunction: () {
                          setState(() {
                            navigateTO(context, SignInScreen());
                          });
                        }),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
