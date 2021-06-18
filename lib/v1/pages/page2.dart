import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/v1/common/design.dart';

class Page2 extends StatelessWidget {
  final double page1Value;
  final double value;

  const Page2({Key? key, required this.value, required this.page1Value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    var dx = 0.0;
    var dy = design.screenSize.height * value;

    return Transform.translate(
      offset: Offset(dx, dy),
      child: PageEx(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: min(1.0, page1Value),
              child: Text(
                "Skills",
                style: design.header2Style,
              ),
            ),
            SizedBox(height: design.screenPadding),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: design.screenPadding,
                  crossAxisSpacing: design.screenPadding,
                ),
                itemBuilder: (context, index) {
                  var scale = min(1.0, value * 1.5);
                  var origin = design.screenSize
                      .center(Offset(-design.screenSize.width * 0.5, 0.0));

                  return Transform.scale(
                    scale: scale,
                    origin: origin,
                    child: _buildPage3Item(design, index, kSkillData[index]),
                  );
                },
                itemCount: kSkillData.length,
                clipBehavior: Clip.none,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage3Item(Design design, int index, Map<String, dynamic> data) {
    return Container(
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
          SizedBox(height: design.itemPadding),
          Text(
            data['t'],
            style: design.titleTextStyle.copyWith(
              color: kAccentColor,
            ),
            maxLines: 1,
          ),
          SizedBox(height: design.itemPadding),
          Expanded(
            child: Text(
              data['d'],
              style: design.bodyTextStyle,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
