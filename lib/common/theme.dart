import 'package:flutter/material.dart';
import 'package:introduction/common/constants_color.dart';

ThemeData ligThemeData(BuildContext context) {
  return ThemeData.light(useMaterial3: true).copyWith(
      primaryColor: kLigthPrimartColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.light(
          error: kErrorColor,
          primary: kLigthPrimartColor,
          secondary: kLigthSecondaryColor),
      appBarTheme: appBarTheme);
}

ThemeData darkemeData(BuildContext context) {
  return ThemeData.light(useMaterial3: true).copyWith(
      primaryColor: kLigthPrimartColor,
      scaffoldBackgroundColor: kDarkColor,
      colorScheme: const ColorScheme.light(
          error: kErrorColor,
          primary: kLigthPrimartColor,
          secondary: kLigthSecondaryColor),
      appBarTheme: appBarTheme.copyWith(
          backgroundColor: kDarkColor,
          iconTheme: IconThemeData(
            color: kWhiteColor,
          )));
}

const appBarTheme = AppBarTheme(
    titleTextStyle: TextStyle(
      color: kDarkColor,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: kLigthPrimartColor,
    ),
    centerTitle: false,
    elevation: 0,
    backgroundColor: kWhiteColor);
