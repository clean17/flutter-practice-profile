import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.lightBlue,
      ),
    ),
  );
}