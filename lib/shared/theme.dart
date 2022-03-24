// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdwl_app/shared/size.dart';

import 'global_config.dart';

const _colorSchemeLight = ColorScheme(
    primary: Colors.blue,
    primaryVariant: Colors.blue,
    secondary: Colors.white,
    secondaryVariant: Colors.white,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.grey,
    onSurface: Colors.blue,
    onBackground: Colors.blue,
    onError: Colors.blue,
    brightness: Brightness.light);

class MyTheme {
  ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: _colorSchemeLight.background,
      backgroundColor: _colorSchemeLight.background,
      colorScheme: _colorSchemeLight,
      appBarTheme: AppBarTheme(
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
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _colorSchemeLight.primary,
      ),
      textButtonTheme: transparentTextButton(),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: defaultIconSize,
      ),
      primaryColor: _colorSchemeLight.primary,
      fontFamily: enFont,
    );
  }
}

TextTheme _getTextTheme() {
  return TextTheme(
    headline6: TextStyle(
        color: _colorSchemeLight.secondaryVariant,
        fontSize: 16.sp,
        fontFamily: enFont,
        height: 1.2.h
    ),
    headline5: TextStyle(
        color: _colorSchemeLight.secondaryVariant,
        fontSize: 20.sp,
        fontFamily: enFont,
        height: 1.2.h),
    headline4: TextStyle(
        color: _colorSchemeLight.secondaryVariant,
        fontSize: 23.sp,
        fontFamily: enFont,
        height: 1.2.h),
    headline3: TextStyle(
        color: _colorSchemeLight.secondaryVariant,
        fontSize: 25.sp,
        fontFamily: enFont,
        height: 1.2.h),
    headline2: TextStyle(
        color: _colorSchemeLight.secondaryVariant,
        fontSize: 27.sp,
        fontFamily: enFont,
        height: 1.2.h),
    headline1: TextStyle(
        color: _colorSchemeLight.secondaryVariant,
        fontSize: 36.sp,
        fontFamily: enFont,
        height: 1.2.h),
    subtitle1: TextStyle(
      color: _colorSchemeLight.secondaryVariant,
      fontSize: 16.sp,
      height: 1.2.h,
      fontFamily: enFont,
    ),
    bodyText1: TextStyle(
      color: _colorSchemeLight.secondaryVariant,
      fontSize: 16.sp,
      height: 1.2.h,
      fontFamily: enFont,
    ),
    bodyText2: TextStyle(
      color: _colorSchemeLight.secondaryVariant,
      fontSize: 16.sp,
      height: 1.2.h,
      fontFamily: enFont,
    ),
    caption: TextStyle(
      color: _colorSchemeLight.secondaryVariant,
      fontSize: 16.sp,
      height: 1.2.h,
      fontFamily: enFont,
    ),
    overline: TextStyle(
      color: _colorSchemeLight.secondaryVariant,
      fontSize: 16.sp,
      height: 1.2.h,
      fontFamily: enFont,
    ),
    subtitle2: TextStyle(
      color: _colorSchemeLight.secondaryVariant,
      fontSize: 16.sp,
      fontFamily: enFont,
      height: 2.5.h,
    ),
    button: TextStyle(
        color: _colorSchemeLight.background,
        fontSize: 15.sp,
        height: 1.2.h,
        fontWeight: FontWeight.bold
    ),
  ).apply(
    decorationColor: _colorSchemeLight.onSurface,
    bodyColor: _colorSchemeLight.onSurface,
    displayColor: _colorSchemeLight.onSurface,
  );
}

TextButtonThemeData transparentTextButton() {
  final double _maxButtonHeight = 50.0.h;
  final double _maxButtonWidth = 300.0.w;

  return TextButtonThemeData(
      style: TextButton.styleFrom(
    backgroundColor: Colors.transparent,
    primary: _colorSchemeLight.onPrimary,
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
    minimumSize: Size(0, _maxButtonHeight),
    textStyle: TextStyle(
      fontFamily: enFont,
      fontSize: 16.sp,
    ),
    maximumSize: Size(_maxButtonWidth, _maxButtonHeight),
    elevation: 0,
  ));
}
