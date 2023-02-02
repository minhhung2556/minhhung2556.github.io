import 'package:flutter/material.dart';

import '../../index.dart';

class Styles {
  static const mainBackgroundColor = const Color(0xff141414);
  static const buttonOverlayColor = const Color(0x66CDB070);
  static const accentColor = const Color(0xffE2AF9B);
  static const mainBackgroundBlurColor = Colors.black54;

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
    overlayColor: MaterialStateProperty.all<Color>(buttonOverlayColor),
    minimumSize: MaterialStateProperty.all<Size>(Size.zero),
  );
  static final menuButtonTextStyle = const TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: Fonts.fontFamilyUbuntuLight,
  );
  static final nameTextStyle = const TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: Fonts.fontFamilyAbrilFatfaceRegular,
  );
}
