import 'dart:ui';

import 'package:flutter/material.dart';

const kScreenPadding = 24.0;
const kItemPadding = 16.0;
const kBorderRadius = 4.0;
final kBorder = BorderRadius.circular(kBorderRadius);
const kIconSize = 32.0;
const kItemColor = const Color(0x08ffffff);
final kColorTween12 = ColorTween(begin: kCardColor, end: Colors.black);
const kSocialIconSize = 30.0;
const kAccentColor = Colors.cyan;
const kCardColor = const Color(0xff111111);
const kLightestColor = Colors.white;
const kGreyColor = Colors.grey;
const kDarkestColor = Colors.black;

double designFactor(Size screenSize) {
  return screenSize.width / 375.0;
}

class Design {
  final Size screenSize;

  Design(this.screenSize) {
    // print('Design: $screenSize');
  }

  bool get isPortrait => screenSize.width / screenSize.height < 1.6;

  double get factor => 1.0;
  double get screenPadding => kScreenPadding * factor;
  double get screenPaddingX2 => screenPadding * 2;
  double get screenPlusItemPadding => screenPadding + itemPadding;
  double get itemPadding => kItemPadding * factor;
  double get bodyDescTextSize => 10.0 * factor;
  double get bodyTextSize => 12.0 * factor;
  double get header1TextSize => 24.0 * factor;
  double get header2TextSize => 20.0 * factor;
  double get header3TextSize => 16.0 * factor;
  double get titleTextSize => 14.0 * factor;
  double get borderRadius => 6.0 * factor;
  double get iconSize => 24.0 * factor;
  double get largeIconSize => iconSize * 1.5;

  TextStyle get bodyStyle => TextStyle(
        fontSize: bodyTextSize,
        color: kLightestColor,
      );

  TextStyle get bodyTextStyle => TextStyle(
        fontSize: bodyTextSize,
        color: kGreyColor,
      );

  TextStyle get bodyDescTextStyle => TextStyle(
        fontSize: bodyDescTextSize,
        color: kGreyColor,
      );

  TextStyle get titleTextStyle => TextStyle(
        fontSize: titleTextSize,
        color: kGreyColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle get header1Style => TextStyle(
        fontSize: header1TextSize,
        color: kLightestColor,
        fontWeight: FontWeight.bold,
      );

  TextStyle get header2Style => TextStyle(
        fontSize: header2TextSize,
        color: kLightestColor,
        fontWeight: FontWeight.bold,
      );

  TextStyle get header3Style => TextStyle(
        fontSize: header3TextSize,
        color: kLightestColor,
        fontWeight: FontWeight.bold,
      );

  RoundedRectangleBorder get borderShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: Colors.white10,
          width: 2,
        ),
      );
}

class PageEx extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsets? padding;

  const PageEx({
    Key? key,
    required this.child,
    this.color = Colors.transparent,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    return Container(
      color: color,
      width: design.screenSize.width,
      height: design.screenSize.height,
      padding: padding ?? EdgeInsets.all(design.screenPadding),
      child: child,
    );
  }
}

class CardEx extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const CardEx({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    return Card(
      color: kCardColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(design.borderRadius),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(design.screenPadding),
        child: child,
      ),
    );
  }
}
