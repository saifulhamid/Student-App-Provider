import 'package:flutter/material.dart';

Widget appBarStyle(String text, Color color){
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: color
    ),
  );
}

Widget sizedBoxes ({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget textFormField({required String labelText, required TextEditingController controller}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder()
    ),
  );
}

Widget text({required String text, double? fontSize, Color? color}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        color: color,
    ),
  );
}

Widget detailsPageText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight
}){
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight
    ),
  );

}