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
        titleTextStyle: getTextTheme().headline3!.copyWith(color: Colors.white),
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
      inputDecorationTheme: _inputDecorationTheme(),
      textButtonTheme: transparentTextButton(),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: defaultIconSize,
      ),
      primaryColor: _colorSchemeLight.primary,
      fontFamily: enFont,
    );
  }

  static TextTheme getTextTheme() {
    return TextTheme(
      headline6: TextStyle(
        color: _colorSchemeLight.secondaryVariant,
        fontSize: 18.sp,
        fontFamily: enFont,
        height: 1.2.h,
        fontWeight: FontWeight.w400,
      ),
      headline5: TextStyle(
          color: _colorSchemeLight.secondaryVariant,
          fontSize: 18.sp,
          fontFamily: enFont,
          height: 1.2.h,
          fontWeight: FontWeight.w500
      ),
      headline4: TextStyle(
          color: _colorSchemeLight.secondaryVariant,
          fontSize: 22.sp,
          fontFamily: enFont,
          height: 1.2.h,
          fontWeight: FontWeight.w400
      ),
      headline3: TextStyle(
          color: _colorSchemeLight.secondaryVariant,
          fontSize: 22.sp,
          fontFamily: enFont,
          height: 1.2.h,
          fontWeight: FontWeight.w500
      ),
      headline2: TextStyle(
          color: _colorSchemeLight.secondaryVariant,
          fontSize: 24.sp,
          fontFamily: enFont,
          height: 1.2.h,
          fontWeight: FontWeight.w400
      ),
      headline1: TextStyle(
          color: _colorSchemeLight.secondaryVariant,
          fontSize: 24.sp,
          fontFamily: enFont,
          height: 1.2.h,
          fontWeight: FontWeight.w500
      ),
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
        height: 1.5.h,
      ),
      button: TextStyle(
          color: _colorSchemeLight.background,
          fontSize: 13.sp,
          height: 1.2.h,
          fontWeight: FontWeight.bold
      ),
    ).apply(
      decorationColor: _colorSchemeLight.onSurface,
      bodyColor: _colorSchemeLight.onSurface,
      displayColor: _colorSchemeLight.onSurface,
    );
  }

}



InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
  floatingLabelStyle: MyTheme.getTextTheme().subtitle2,
  labelStyle: MyTheme.getTextTheme().subtitle2,
  hintStyle: MyTheme.getTextTheme().subtitle2!.copyWith(color: Colors.grey),
  errorStyle: MyTheme.getTextTheme().subtitle2!.copyWith(
      height: 1.2.h, fontSize: 14.sp, color: Colors.red[300]
  ),
  filled: true,
  fillColor: _colorSchemeLight.surface,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: _colorSchemeLight.primary),
    borderRadius: BorderRadius.all(Radius.circular(circleRadius)),
    gapPadding: 0,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.transparent
    ),
    borderRadius: BorderRadius.all(Radius.circular(circleRadius)),
  ),
  isDense: false,
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: _colorSchemeLight.error),
    borderRadius: BorderRadius.all(Radius.circular(circleRadius)),
    gapPadding: 0,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent
      // color: _colorSchemeLight
      //     .onBackground
    ),
    borderRadius: BorderRadius.all(Radius.circular(circleRadius)),
    gapPadding: 0,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: _colorSchemeLight.error),
    borderRadius: BorderRadius.all(Radius.circular(circleRadius)),
    gapPadding: 0,
  ),
);


TextButtonThemeData transparentTextButton() {
  final double _maxButtonHeight = 50.0.h;
  final double _maxButtonWidth = 300.0.w;

  return TextButtonThemeData(
      style: TextButton.styleFrom(
    backgroundColor: Colors.transparent,
    primary: _colorSchemeLight.onPrimary,
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
    minimumSize: Size(0, _maxButtonHeight),
    textStyle: MyTheme.getTextTheme().button,
    maximumSize: Size(_maxButtonWidth, _maxButtonHeight),
    elevation: 0,
  ));
}
