import 'package:flutter/material.dart';

 const _colorSchemeLight = ColorScheme(
    primary: Colors.blue,
    primaryVariant: Colors.blue,
    secondary: Colors.blue,
    secondaryVariant: Colors.blue,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.blue,
    onPrimary: Colors.white,
    onSecondary: Colors.grey,
    onSurface: Colors.blue,
    onBackground: Colors.blue,
    onError: Colors.blue,
    brightness: Brightness.light
);

class MyTheme {

  ThemeData getTheme(){
  return  ThemeData(
    scaffoldBackgroundColor: _colorSchemeLight.background,
    backgroundColor: _colorSchemeLight.background,
    colorScheme: _colorSchemeLight,
    appBarTheme:  AppBarTheme(
      titleSpacing: 0.0,
      titleTextStyle: TextStyle(
        color: _colorSchemeLight.onPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      ),
      elevation: 1.0,
      shadowColor: Colors.transparent,
      color: _colorSchemeLight.onBackground,
      foregroundColor: _colorSchemeLight.onBackground,
      centerTitle: true,
      iconTheme: IconThemeData(color: _colorSchemeLight.onPrimary),
    ),
  );
  }

 }