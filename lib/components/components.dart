import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

Widget buildFormFieldText({
  required TextEditingController controller,
  required String labelText,
  String? hintText,
  TextInputType keyboardType = TextInputType.name,
  IconData? prefixIcon,
  Color prefixIconColor = rgbBahgaPurple3,
  validate,
  IconData? suffix,
  Color suffixColor = rgbBahgaPurple3,
  suffixPressed, // Function
  bool isSecure = false,
  onSubmit,
  onChange,
  Function()? onTap,
  bool isClickable = true,
  Color backgroundOfTextFeild = Colors.white,
  Color notFocusedBorderColor = rgbBahgaPurple1,
  Color focusedBorderColor = rgbBahgaPurple3,
}) =>
    TextFormField(
      obscureText: isSecure,
      validator: validate,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(
            color: focusedBorderColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        filled: true,
        fillColor: backgroundOfTextFeild,
        border: const OutlineInputBorder(
            // borderSide: BorderSide(width: 3, color: Colors.yellowAccent),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: notFocusedBorderColor),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: focusedBorderColor, width: 2),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "JostBold",
        ),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: prefixIconColor),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix, color: suffixColor),
        ),
      ),
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      enabled: isClickable,
    );

Widget buildElevatedTextButton({
  required Color backgroundColor,
  double colorOpacity = 1,
  onPressedFunction,
  Color titleOfButtonColor = Colors.white,
  required String titleOfButton,
  required Color borderColor,
  double borderColorOpacity = 1,
  required double widthOfBorder,
  double textSize = 16.00,
  double? buttonWidth,
}) =>
    Container(
      width: buttonWidth,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
              backgroundColor.withOpacity(colorOpacity)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                  color: borderColor.withOpacity(borderColorOpacity),
                  width: widthOfBorder),
            ),
          ),
        ),
        onPressed: onPressedFunction,
        child: Text(
          titleOfButton,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: textSize,
              color: titleOfButtonColor),
        ),
      ),
    );
Widget buildTextJost({
  required String text,
  Color textColor = rgbBahgaPurple3,
  required double textSize,
  FontWeight textBold = FontWeight.bold,
  TextAlign textAlign = TextAlign.center,
  int? maxLines,
  // FontWeight textBold = FontWeight.bold,
  TextOverflow? overflow,
}) =>
    Text(
      text,
      style: TextStyle(
          fontFamily: 'JostBold',
          fontWeight: textBold,
          fontSize: textSize,
          color: textColor),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );

Widget buildTextJostNormal({
  required String text,
  Color textColor = rgbBahgaPurple3,
  required double textSize,
  int? maxLines,
  // FontWeight textBold = FontWeight.bold,
  TextOverflow? overflow,
  TextAlign textAlign = TextAlign.center,
  TextDecoration? lineThrough,
}) =>
    Text(
      text,
      style: TextStyle(
          decoration: lineThrough,
          fontFamily: 'JostNormal',
          // fontWeight: textBold,
          fontSize: textSize,
          color: textColor),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );



Future navigateTO(context, widget) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => widget));
}

Future navigateTOAndReplacement(context, widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Future<bool?> buildFlutterToast({
  required String message,
  required ToastStates state,
}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = const Color.fromARGB(255, 165, 99, 0);
      break;
  }
  return color;
}

buildListTileCard({
  Color backgroundColorCard = Colors.white,
  IconData? leadingIcon,
  required String title,
  Color titleColor = rgbBahgaPurple3,
  subTitle,
  double titleSize = 16,
  Color leadingIconColor = rgbBahgaPurple3,
  Color trailingIconColor = rgbBahgaPurple3,
  IconData? trailingIcon,
  Function()? trailingOnPressedFunction,
  Function()? onTapCardFunction,
}) {
  return Card(
    elevation: 0,
    color: backgroundColorCard,
    child: ListTile(
      onTap: onTapCardFunction,
      leading: Icon(
        leadingIcon,
        color: leadingIconColor,
      ),
      title: buildTextJostNormal(
        text: title,
        textColor: titleColor,
        textSize: titleSize,
        textAlign: TextAlign.start,
      ),
      subtitle: subTitle,
      trailing: IconButton(
        onPressed: trailingOnPressedFunction,
        icon: Icon(
          trailingIcon,
          color: trailingIconColor,
        ),
      ),
    ),
  );
}

buildListTileCardWithoutLeading({
  Color backgroundColorCard = Colors.white,
  required String title,
  subTitle,
  IconData? trailingIcon,
  Function()? trailingOnPressedFunction,
  Function()? onTapCardFunction,
}) {
  return InkWell(
    onTap: onTapCardFunction,
    child: Card(
      elevation: 0,
      color: backgroundColorCard,
      child: ListTile(
        title: Text(title),
        subtitle: subTitle,
        trailing: IconButton(
          onPressed: trailingOnPressedFunction,
          icon: Icon(trailingIcon),
        ),
      ),
    ),
  );
}

buildDisabledText({required String text, double textSize = 14}) {
  return Text(
    text,
    style: TextStyle(fontSize: textSize, color: Colors.grey),
  );
}

buildIconButton({
  required IconData icon,
  Function()? iconOnPressedFunction,
  Color iconColor = Colors.white,
}) {
  return IconButton(
    onPressed: iconOnPressedFunction,
    icon: Icon(
      icon,
    ),
    color: iconColor,
  );
}

buildDrawerButton({
  context,
  required List<Widget> drawerWidgetItemsList,
}) =>
    Drawer(
      backgroundColor: rgbBahgaPurple1,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: drawerWidgetItemsList,
            ),
          ),
        ),
      ),
    );
