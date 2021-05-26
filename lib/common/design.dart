import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:minhhung2556/common/res.dart';

class Design {
  final Size screenSize;

  Design(this.screenSize) {
    // print('Design: $screenSize');
  }

  double get factor => screenSize.width / 1280;
  double get screenPadding => 48.0 * factor;
  double get screenPaddingX2 => screenPadding * 2;
  double get screenPlusItemPadding => screenPadding + itemPadding;
  double get itemPadding => 12.0 * factor;
  double get bodyTextSize => 14.0 * factor;
  double get header1TextSize => 32.0 * factor;
  double get header2TextSize => 26.0 * factor;
  double get header3TextSize => 20.0 * factor;
  double get titleTextSize => 16.0 * factor;
  double get borderRadius => 6.0 * factor;
  double get iconSize => 32.0 * factor;

  TextStyle get bodyDescStyle => TextStyle(
        fontSize: bodyTextSize,
        color: kGreyColor,
      );

  TextStyle get titleDescStyle => TextStyle(
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

  const PageEx(
      {Key? key, required this.child, this.color = kDarkestColor, this.padding})
      : super(key: key);
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

  const CardEx({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    return Card(
      color: kCardColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(design.screenPadding),
        child: child,
      ),
    );
  }
}
