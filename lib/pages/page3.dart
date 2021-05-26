import 'dart:html' as html;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhhung2556/common/design.dart';
import 'package:minhhung2556/common/flat_elevated_button.dart';
import 'package:minhhung2556/common/res.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/generated/assets.dart';

class Page3 extends StatelessWidget {
  final double page1Value;
  final double page2Value;
  final double value;
  final double page4Value;
  final ScrollController controller;
  const Page3({
    Key? key,
    required this.value,
    required this.page1Value,
    required this.page2Value,
    required this.page4Value,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    var itemW = (design.screenSize.width - design.screenPadding * 4) / 3.5;
    var itemH = (itemW * 1.7777).roundToDouble();
    var dx = 0.0;
    var dy = design.screenSize.height * (value + page4Value);

    return Transform.translate(
      offset: Offset(dx, dy),
      child: Opacity(
        opacity: value,
        child: PageEx(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: design.screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Works",
                style: design.header2Style,
              ),
              SizedBox(height: design.screenPadding),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: kWorksData.length,
                  itemBuilder: (context, index) {
                    var dy = itemH -
                        max(
                                0.0,
                                min(
                                    1.0,
                                    value *
                                        pow(1.5,
                                            kWorksData.length - index - 1))) *
                            itemH;
                    var offset = Offset(0.0, dy);
                    return Transform.translate(
                      offset: offset,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? design.screenPadding : 0,
                          right: design.screenPadding,
                        ),
                        child: _buildPage4Item(
                            design, itemW, itemH, index, kWorksData[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage4Item(Design design, double itemW, double itemH, int index,
      Map<String, dynamic> data) {
    return Container(
      width: itemW,
      height: itemH,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          image: Image.asset(
            data['i'],
            width: itemW,
          ).image,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: kLightestColor,
          padding: EdgeInsets.symmetric(
              horizontal: design.itemPadding, vertical: design.itemPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data['c'],
                style: design.titleDescStyle.copyWith(color: kDarkestColor),
                maxLines: 1,
              ),
              SizedBox(height: design.itemPadding),
              Padding(
                padding: EdgeInsets.only(
                    left: design.itemPadding * 0.5,
                    right: design.itemPadding * 0.5),
                child: Text(
                  '----- ${data['d']}',
                  style: design.bodyDescStyle,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: design.itemPadding),
              const Divider(height: 1.0),
              SizedBox(height: design.itemPadding),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: data['ls'].map<Widget>((e) {
                    Widget c;
                    var iconSize = design.iconSize;
                    var iconColor = kGreyColor;
                    switch (e['n'].toString().toLowerCase()) {
                      case 'android':
                        c = Icon(
                          Icons.android_rounded,
                          size: iconSize,
                          color: iconColor,
                        );
                        break;
                      case 'ios':
                        c = Image.asset(
                          Assets.assetLogoapple,
                          width: iconSize,
                          height: iconSize,
                          color: iconColor,
                        );
                        break;
                      case 'website':
                      default:
                        c = Icon(
                          Icons.forward,
                          size: iconSize,
                          color: iconColor,
                        );
                        break;
                    }
                    return Padding(
                      padding: EdgeInsets.only(right: design.itemPadding),
                      child: buildCircleButton(
                        child: c,
                        onPressed: () {
                          html.window.open(e['l'], e['n']);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
