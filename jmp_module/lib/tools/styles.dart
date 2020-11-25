import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle normalStyle(double fontSize, Color color,
      [Color backgroundColor, double height]) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      backgroundColor: backgroundColor,
      height: height,
      color: color,
    );
  }

  static TextStyle boldStyle(double fontSize, Color color,
      [Color backgroundColor, double height]) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      backgroundColor: backgroundColor,
      height: height,
      color: color,
    );
  }

  static TextStyle mediumStyle(double fontSize, Color color,
      [Color backgroundColor, double height]) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      backgroundColor: backgroundColor,
      height: height,
      color: color,
    );
  }
}