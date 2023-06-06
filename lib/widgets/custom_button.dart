import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, required this.buttonTo});
  String buttonTo;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(18),
        ),
        width: double.infinity,
        height: 45,
        child: Center(
            child: Text(
          buttonTo,
          style: TextStyle(
            fontSize: 18,
          ),
        )),
      ),
    );
  }
}
