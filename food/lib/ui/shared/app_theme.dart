import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoAppTheme {
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  static const Color normalTextColors = Colors.red;

  static final ThemeData normalTheme = ThemeData(
      // 主题色
      primarySwatch: Colors.purple,
      // 背景色
      canvasColor: Colors.grey[100],
      textTheme: TextTheme(
          headline1: TextStyle(fontSize: smallFontSize),
          headline2: TextStyle(fontSize: normalFontSize, color: Colors.black),
          headline3: TextStyle(fontSize: largeFontSize),
          bodyText1:
              TextStyle(fontSize: bodyFontSize, color: normalTextColors)));

  static const Color darkTextColors = Colors.purple;

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.cyan,
      textTheme: TextTheme(
          bodyText1:
              TextStyle(fontSize: normalFontSize, color: normalTextColors)));
}
