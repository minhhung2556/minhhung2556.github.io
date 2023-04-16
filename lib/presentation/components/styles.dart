import 'package:flutter/material.dart';

import '../../generated/index.dart';

final kThemeData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: Fonts.fontFamilyTitle,
    ),
    headline2: TextStyle(
      fontFamily: Fonts.fontFamilyTitle,
    ),
    headline3: TextStyle(
      fontFamily: Fonts.fontFamilyMostFocus,
    ),
    headline4: TextStyle(
      fontFamily: Fonts.fontFamilyComponentText,
    ),
    headline5: TextStyle(
      fontFamily: Fonts.fontFamilyComponentText,
    ),
    headline6: TextStyle(
      fontFamily: Fonts.fontFamilyComponentText,
    ),
    bodyText1: TextStyle(
      fontFamily: Fonts.fontFamilyComponentText,
    ),
  ),
);

const kScreenPadding = const EdgeInsets.symmetric(horizontal: 48, vertical: 24);
