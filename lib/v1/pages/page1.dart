import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/generated/assets.dart';
import 'package:minhhung2556/v1/common/design.dart';

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
              style: design.bodyTextStyle,
            ),
            SizedBox(height: design.itemPadding),
            Text(
              kMyName,
              style: design.header2Style,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: design.itemPadding),
            Text(
              kMyTitle,
              textAlign: TextAlign.center,
              style: design.bodyTextStyle,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: Offset(0.0, -design.itemPadding),
                        child: Image.asset(
                          Assets.assetDigital1,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Image.asset(
                        Assets.assetAvatar,
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: design.itemPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kSummaryData[0],
                        style: design.titleTextStyle
                            .copyWith(color: kLightestColor),
                      ),
                      Icon(
                        Icons.wifi_tethering,
                        color: kAccentColor,
                        size: design.iconSize,
                      ),
                      Text(
                        kSummaryData[1],
                        style: design.bodyDescTextStyle,
                      ),
                      Text(
                        kSummaryData[2],
                        style: design.bodyDescTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Transform.translate(
      offset: Offset(dx, dy),
      child: PageEx(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: design.screenPadding),
              child: top,
            ),
            bottom,
          ],
        ),
      ),
    );
  }
}
