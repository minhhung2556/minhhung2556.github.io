import 'dart:ui';

import 'package:flutter/material.dart';

class Design {
  static const fontFamily = 'MyFontFamily';
  static const colorPrimaryDark = Color(0xff0E1319);
  static const colorPrimaryAccentDark = Color(0xff2C3541);
  static const colorPrimaryLight = Colors.white;
  static const colorPrimaryAccentLight = Color(0xffD9D9DA);
  static const screenPadding = 24.0;
  static const itemPadding = 4.0;
  static const iconSize = 32.0;
  static const socialIconSize = 30.0;
  static const topMenuBar = 56.0;

  static const textStyleTitleDark = TextStyle(
    fontFamily: fontFamily,
    color: colorPrimaryDark,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const textStyleRegularDark = TextStyle(
    fontFamily: fontFamily,
    color: colorPrimaryDark,
    fontSize: 14,
  );

  static final textStyleTitleLight =
      textStyleTitleDark.copyWith(color: colorPrimaryLight);

  static final textStyleRegularLight =
      textStyleRegularDark.copyWith(color: colorPrimaryAccentLight);
}
