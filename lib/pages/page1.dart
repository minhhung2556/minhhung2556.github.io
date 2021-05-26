import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhhung2556/common/design.dart';
import 'package:minhhung2556/common/res.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/generated/assets.dart';

class Page1 extends StatelessWidget {
  final double value;

  const Page1({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    var deltaX = design.screenSize.width / 2;

    return Transform.translate(
      offset: Offset(0, -value * design.screenSize.height),
      child: PageEx(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: design.screenPadding),
            Opacity(
              opacity: max(0.0, 1 - value),
              child: Transform.translate(
                offset: Offset(-value * deltaX, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      kSayHi,
                      style: design.bodyDescStyle,
                    ),
                    SizedBox(height: design.itemPadding),
                    Text(
                      kMyName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: design.header1TextSize,
                        color: kLightestColor,
                      ),
                    ),
                    SizedBox(height: design.itemPadding),
                    SizedBox(
                      width: design.screenSize.width / 3,
                      child: Text(
                        kMyTitle,
                        textAlign: TextAlign.center,
                        style: design.titleDescStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                width: design.screenPlusItemPadding,
                height: design.screenPlusItemPadding),
            Expanded(
              child: Opacity(
                opacity: max(0.0, 1 - value),
                child: Transform.translate(
                  offset: Offset(value * deltaX, 0),
                  child: CardEx(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: design.screenPlusItemPadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Transform.translate(
                                    offset: Offset(0, -design.itemPadding * 3),
                                    child: Container(
                                      color: Colors.white10,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: design.itemPadding * 2),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset:
                                        Offset(0, -design.itemPadding * 1.5),
                                    child: Container(
                                      color:
                                          Colors.cyan.shade100.withOpacity(0.3),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: design.itemPadding),
                                    ),
                                  ),
                                  Image.asset(
                                    Assets.assetAvatar,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: design.itemPadding * 2),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: kSummaryData[0],
                                      style: design.header3Style,
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.wifi_tethering,
                                        color: kAccentColor,
                                        size: design.iconSize,
                                      ),
                                    ),
                                    TextSpan(
                                      text: kSummaryData[1],
                                      style: design.titleDescStyle,
                                    ),
                                    TextSpan(
                                      text: kSummaryData[2],
                                      style: design.bodyDescStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
