import 'package:flutter/material.dart';

class Design {
  static Color green = Color(0xFF65A197);
  static Color textColor = Color(0xFF);
  static Color lightWhite = Color(0xFFF1F1F1);
  static Color lightTextColor = Color(0xFFB9B8B8);
  static Color darkTextColor = Color(0xFF707070);
  static Color border = Color(0xFFAFAEAE);

  static OutlineInputBorder textFieldBorder({
    Color? color,
    double? width,
    double? radius,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: BorderRadius.circular(9),
    );
  }
}
