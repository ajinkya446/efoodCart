import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget uiTextWidget(
    String labelName, Color color, FontWeight boldWeight, double fontSize) {
  return Text(
    labelName,
    style: TextStyle(
      color: color,
      fontWeight: boldWeight,
      fontSize: fontSize,
    ),
  );
}

Widget uiTextFieldWidget(
    String label, TextEditingController controller, int lineCount) {
  return TextField(
      maxLines: lineCount,
      controller: controller,
      decoration: InputDecoration(
          hintText: label,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          border: InputBorder.none));
}

Widget uiTextFieldContainer(
    String fieldName, TextEditingController controller, int lineCount) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30),
    margin: EdgeInsets.symmetric(horizontal: 30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black)),
    child: uiTextFieldWidget(fieldName, controller, lineCount),
  );
}

Widget uiElevatedButton(
    onPressed, String buttonName, Color color, FontWeight weight, double size) {
  return ElevatedButton(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(double.maxFinite, 70)),
      backgroundColor: MaterialStateProperty.all(Color(0xff739DBC)),
    ),
    onPressed: () => onPressed(),
    child: uiTextWidget(buttonName, color, weight, size),
  );
}

