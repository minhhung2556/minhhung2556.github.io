import 'package:flutter/material.dart';

import '../../generated/index.dart';

final kThemeData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Color(0xFFb39ddb),
  colorScheme: ColorScheme.dark(),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: Fonts.fontFamilyTitle,
    ),
    displayMedium: TextStyle(
      fontFamily: Fonts.fontFamilyTitle,
    ),
    displaySmall: TextStyle(
      fontFamily: Fonts.fontFamilyMostFocus,
    ),
    headlineMedium: TextStyle(
      fontFamily: Fonts.fontFamilyComponentText,
    ),
    headlineSmall: TextStyle(
      fontFamily: Fonts.fontFamilyComponentText,
    ),
    titleLarge: TextStyle(
      fontFamily: Fonts.fontFamilyComponentText,
    ),
    bodyLarge: TextStyle(
      fontFamily: Fonts.fontFamilyComponentText,
    ),
  ),
);

const kScreenPadding = const EdgeInsets.symmetric(horizontal: 48, vertical: 24);
