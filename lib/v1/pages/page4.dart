import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/generated/assets.dart';
import 'package:minhhung2556/v1/common/design.dart';
import 'package:minhhung2556/v1/common/flat_elevated_button.dart';
import 'package:minhhung2556/v1/common/res.dart';

class Page4 extends StatelessWidget {
  final double page1Value;
  final double page2Value;
  final double page3Value;
  final double value;
  final AnimationController animationController;

  const Page4({
    Key? key,
    required this.page1Value,
    required this.page2Value,
    required this.page3Value,
    required this.value,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    var dx = 0.0;
    var dy = design.screenSize.height * (value + 1);
    var deltaX = design.screenPadding;
    var deltaY = design.largeIconSize / 2;

    return Transform.translate(
      offset: Offset(dx, dy),
      child: PageEx(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (design.isPortrait)
              Expanded(
                child: Container(),
                flex: 2,
              ),
            Expanded(
              flex: 2,
              child: CardEx(
                padding: EdgeInsets.only(
                    left: design.screenPadding,
                    top: design.screenPadding,
                    bottom: design.screenPadding,
                    right: design.screenPadding + deltaX),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 10,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Image.asset(
                                Assets.assetAvatar1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                    SizedBox(width: design.itemPadding),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              "Drop A Line",
                              style: design.header2Style,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: design.itemPadding,
                                bottom: design.itemPadding + deltaY,
                              ),
                              child: Icon(
                                Icons.stacked_line_chart,
                                size: design.iconSize,
                                color: kAccentColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: FittedBox(
                                child: Container(
                                  color: Colors.black45,
                                  child: Transform.translate(
                                    offset:
                                        Offset(design.screenPadding, -deltaY),
                                    child: Container(
                                      color: Colors.white30,
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        children: kSocialData
                                            .map<Widget>((e) =>
                                                buildCircleButton(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        design.itemPadding),
                                                    child: Image.asset(
                                                      e['i'],
                                                      width:
                                                          design.largeIconSize,
                                                      height:
                                                          design.largeIconSize,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    html.window
                                                        .open(e['l'], '');
                                                  },
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (design.isPortrait)
              Expanded(
                child: Container(),
                flex: 2,
              ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                verticalDirection: VerticalDirection.up,
                children: [
                  Expanded(
                    child: CardEx(
                      /*padding: EdgeInsets.only(
                          bottom: design.itemPadding * 2,
                          top: design.screenPadding,
                          left: design.screenPadding,
                          right: design.screenPadding,
                          ),*/
                      padding: EdgeInsets.zero,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: design.screenPadding,
                            bottom: design.itemPadding * 2,
                          ),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: kCopyrightData[0],
                                  style: design.bodyDescStyle,
                                ),
                                TextSpan(
                                  text: kCopyrightData[1],
                                  style: design.bodyStyle,
                                ),
                                TextSpan(
                                  text: kCopyrightData[2],
                                  style: design.bodyDescStyle,
                                ),
                                TextSpan(
                                  text: kCopyrightData[3],
                                  style: design.bodySubDescStyle,
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  style: design.bodySubDescStyle,
                                  child: buildFlatButton(
                                    child: Text(
                                      kCopyrightData[4],
                                      style: design.bodySubDescStyle.copyWith(
                                        color: kLightestColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      html.window.open(kCopyrightData[5], '');
                                    },
                                  ),
                                ),
                                TextSpan(
                                  text: kCopyrightData[6],
                                  style: design.bodySubDescStyle,
                                ),
                                TextSpan(
                                  text: kCopyrightData[7],
                                  style: design.bodySubDescStyle,
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  style: design.bodySubDescStyle,
                                  child: buildFlatButton(
                                      child: Text(
                                    kCopyrightData[8],
                                    style: design.bodySubDescStyle.copyWith(
                                      color: kLightestColor,
                                    ),
                                  )),
                                ),
                                TextSpan(
                                  text: kCopyrightData[9],
                                  style: design.bodySubDescStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                        0, design.itemPadding * 1.5 + design.iconSize * 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: kAccentColor,
                          padding: EdgeInsets.symmetric(
                              vertical: design.itemPadding * 1.5,
                              horizontal: design.itemPadding / 2),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(
                                0.0,
                                -0.1,
                              ),
                              end: Offset(
                                0.0,
                                0.1,
                              ),
                            ).animate(animationController),
                            child: Icon(
                              Icons.upgrade,
                              size: design.iconSize,
                              color: kLightestColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
