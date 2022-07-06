import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  ThemeData get materialTheme {
    return ThemeData(
      scaffoldBackgroundColor: MyColors.scaffold,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: MyColors.text,
        ),
        titleTextStyle: TextStyle(
          color: MyColors.text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      fontFamily: "helneuar",
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.primary,
        primary: MyColors.primary,
        secondary: MyColors.secondary,
        tertiary: MyColors.tertiary,
      ),
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: MyColors.text,
        ),
        headline6: TextStyle(color: MyColors.text),
        headline5: TextStyle(color: MyColors.text),
        headline4: TextStyle(color: MyColors.text),
      ),
    );
  }
}
