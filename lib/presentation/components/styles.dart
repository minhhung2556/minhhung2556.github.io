import 'package:flutter/material.dart';

import '../../index.dart';

class MyDimensions {
  static const screenPadding = const EdgeInsets.all(24);
  static const mainComponentPadding = const EdgeInsets.all(16);
  static const mainComponentMargin = const EdgeInsets.all(16);
}

class MyWidgets {
  static const invisibleExpandedBox = const Expanded(child: const SizedBox());
  static const divider = const Divider(height: 1, thickness: 0.5, color: Colors.white);
  static final componentMarginHorizontal = SizedBox(width: MyDimensions.mainComponentMargin.horizontal);
  static final componentMarginVertical = SizedBox(height: MyDimensions.mainComponentMargin.vertical);
  static final componentMarginBox = SizedBox(
      width: MyDimensions.mainComponentMargin.horizontal / 2, height: MyDimensions.mainComponentMargin.vertical / 2);
}

extension MyColors on Colors {
  static const mainBackgroundColor = const Color(0xff141414);
  static const buttonOverlayColor = const Color(0x66CDB070);
  static const accentColor = const Color(0xffE2AF9B);
  static const mainBackgroundBlurColor = Colors.black54;
}

class MyStyles {
  static final menuButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<OutlinedBorder>(const RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(
        topLeft: const Radius.circular(8),
        bottomRight: const Radius.circular(8),
      ),
    )),
    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 16, horizontal: 8)),
    elevation: MaterialStateProperty.all<double>(0),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    overlayColor: MaterialStateProperty.all<Color>(MyColors.buttonOverlayColor),
    minimumSize: MaterialStateProperty.all<Size>(Size.zero),
  );
  static final menuButtonTextStyle = const TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: Fonts.fontFamilyComponentText,
  );
  static final nameTextStyle = const TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: Fonts.fontFamilyComponentText,
    fontWeight: FontWeight.bold,
  );
  static final labelTextStyle = const TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: Fonts.fontFamilyComponentText,
  );
  static final headlineTextStyle = const TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontFamily: Fonts.fontFamilyComponentText,
    fontWeight: FontWeight.bold,
  );
  static final hugeNickNameTextStyle = const TextStyle(
    fontSize: 256,
    color: Colors.white,
    fontFamily: Fonts.fontFamilyMostFocus,
    height: 1,
    letterSpacing: -10,
  );
}
