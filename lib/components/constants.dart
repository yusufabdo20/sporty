import 'package:flutter/material.dart';

import '../screens/SignInScreen/signin_screen.dart';
import '../services/local/cash.dart';
import 'components.dart';


const Color rgbBahgaPurple3 = Color.fromRGBO(25, 0, 153, 1);
const Color rgbBahgaPurple1 = Color.fromRGBO(158, 163, 253, 1);
const Color rgbBahgaPurple2 = Color.fromRGBO(89, 97, 249, 1);
const Color rgbBahgaBlue1 = Color.fromRGBO(1, 153, 255, 1);
const Color rgbBahgagrey1_5 = Color.fromRGBO(111, 112, 111, .5);
const Color rgbBahgaBlack1 = Color.fromRGBO(34, 40, 49, 1);
const Color rgbBahgaWhite1 = Colors.white;
List patterns = [
  {'phonePattern': r'^(?:[0]1)?[0-9]{11}$'},
  {
    'emailPattern':
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  },
  {
    'passwordPattern':
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'
  }
];
void signOut(context) {
  Cash.removeData(key: 'token').then((value) {
    navigateTOAndReplacement(context, SignInScreen());
  });
}