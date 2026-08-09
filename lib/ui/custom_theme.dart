import 'package:flutter/material.dart';

ThemeData iosLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.grey[50],
  appBarTheme: AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.white),
);

ThemeData iosDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900], foregroundColor: Colors.white),
);
