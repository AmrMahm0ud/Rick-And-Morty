import 'package:flutter/material.dart';
import 'color_manager.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.white,
    colorScheme: ColorScheme.light(
      primary: ColorManager.primary,
      secondary: ColorManager.secondary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.surface,
      foregroundColor: ColorManager.textPrimary,
      elevation: 0,
      titleTextStyle: _textTheme.titleLarge,
    ),
    textTheme: _textTheme,
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.disabled,
    ),
    iconTheme: IconThemeData(
      color: ColorManager.iconColor,
    ),
    dividerColor: ColorManager.divider,
  );

  static const TextTheme _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Orbitron',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: ColorManager.textPrimary,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Orbitron',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: ColorManager.textPrimary,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Orbitron',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: ColorManager.textSecondary,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Orbitron',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: ColorManager.textHint,
    ),
  );
}
