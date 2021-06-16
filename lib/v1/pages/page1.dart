import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/generated/assets.dart';
import 'package:minhhung2556/v1/common/design.dart';
import 'package:minhhung2556/v1/common/res.dart';

class Page1 extends StatelessWidget {
  final double value;

  const Page1({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    var deltaX = design.screenSize.width / 2;
    var dx = 0.0;
    var dy = value * design.screenSize.height;

    var top = Opacity(
      opacity: max(0.0, 1 - value),
      child: Transform.translate(
        offset: Offset(-value * deltaX, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
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
              textAlign: TextAlign.center,
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
    );
    var bottom = Opacity(
      opacity: max(0.0, 1 - value),
      child: Transform.translate(
        offset: Offset(value * deltaX, 0),
        child: CardEx(
          child: Padding(
            padding: EdgeInsets.only(top: design.itemPadding),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset(
                          Assets.assetDigital1,
                        ).image,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: design.itemPadding * 3),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          Assets.assetAvatar,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: design.itemPadding * 2),
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
    );

    return Transform.translate(
      offset: Offset(dx, dy),
      child: PageEx(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: kScreenPadding),
                child: top,
              ),
            ),
            Expanded(
              child: bottom,
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
