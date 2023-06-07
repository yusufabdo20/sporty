import 'package:flutter/material.dart';


class CustomformTextField extends StatelessWidget {
  CustomformTextField(
      {super.key, this.onChange, this.label,this.prefixIcon,this.suffix , this.hintText, this.obsecureText = false});
  String? hintText;
  Widget? label;
  Function(String)? onChange;
  bool? obsecureText;
  Widget? prefixIcon;
  Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText!,
      validator: (date) {
        if (date!.isEmpty) {
          return 'value is requaird';
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffix: suffix,
        label: label,
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(12),
            right: Radius.circular(12),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(12),
            right: Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
