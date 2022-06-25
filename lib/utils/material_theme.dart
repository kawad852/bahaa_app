import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  ThemeData get materialTheme {
    return ThemeData(
      scaffoldBackgroundColor: BaseColors.scaffold,
      fontFamily: "BalooBhaijaan",
      colorScheme: ColorScheme.fromSeed(
        seedColor: BaseColors.primary,
        primary: BaseColors.primary,
        secondary: BaseColors.secondary,
        tertiary: BaseColors.tertiary,
      ),
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: BaseColors.text,
        ),
        headline6: TextStyle(color: BaseColors.text),
        headline5: TextStyle(color: BaseColors.text),
        headline4: TextStyle(color: BaseColors.text),
      ),
    );
  }
}
