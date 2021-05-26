import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhhung2556/common/design.dart';
import 'package:minhhung2556/common/res.dart';
import 'package:minhhung2556/data.dart';

class Page2 extends StatelessWidget {
  final double page1Value;
  final double value;

  const Page2({Key? key, required this.value, required this.page1Value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    double fasterValue = min(1, value * 3);
    var dy = fasterValue * design.screenSize.height;

    return Transform.translate(
      offset: Offset(0, dy),
      child: PageEx(
        color: Colors.transparent,
        child: Transform.scale(
          scale: fasterValue,
          origin: Offset(0, 0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Skills",
                style: design.header2Style,
              ),
              SizedBox(height: design.screenPadding),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.7777777,
                    mainAxisSpacing: design.screenPadding,
                    crossAxisSpacing: design.screenPadding,
                  ),
                  itemBuilder: (context, index) =>
                      _buildPage3Item(design, index, kSkillData[index]),
                  itemCount: kSkillData.length,
                  clipBehavior: Clip.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage3Item(Design design, int index, Map<String, dynamic> data) {
    var dx = 0.0;
    var dy = 0.0;
    var gap = design.screenSize.width;

    if (index < 3) {
      dx = (1.0 - value) * gap;
    } else {
      dx = (value - 1.0) * gap;
    }

    return Transform.translate(
      offset: Offset(dx, dy),
      child: Container(
        decoration: ShapeDecoration(
          color: kItemColor,
          shape: design.borderShape,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: design.itemPadding, vertical: design.itemPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data['i'] is String
                ? Image.asset(
                    data['i'],
                    width: design.iconSize,
                    height: design.iconSize,
                    color: kGreyColor,
                    colorBlendMode: BlendMode.srcATop,
                  )
                : Icon(
                    data['i'],
                    color: kGreyColor,
                    size: design.iconSize,
                  ),
            SizedBox(height: design.itemPadding * 1.5),
            Text(
              data['t'],
              style: design.titleDescStyle.copyWith(
                color: kAccentColor,
              ),
              maxLines: 1,
            ),
            SizedBox(height: design.itemPadding * 1.5),
            Expanded(
              child: Text(
                data['d'],
                style: design.bodyDescStyle,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
