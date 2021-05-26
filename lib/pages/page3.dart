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
  final ScrollController controller;

  const Page3(
      {Key? key,
      required this.value,
      required this.page1Value,
      required this.page2Value,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var design = Design(MediaQuery.of(context).size);
    var av = min(1.0, value * 3);
    var dy =
        design.screenSize.height * 0.5 + (1 - av) * design.screenSize.height;
    var itemW = (design.screenSize.width - design.screenPadding * 4) / 3.5;
    var itemH = (itemW * 1.7777).roundToDouble();

    return Transform.translate(
      offset: Offset(0, dy),
      child: Opacity(
        opacity: max(0.0, min(1.0, av)),
        child: PageEx(
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
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? design.screenPadding : 0,
                        right: design.screenPadding),
                    child: _buildPage4Item(
                        av, design, itemW, itemH, index, kWorksData[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage4Item(double value, Design design, double itemW,
      double itemH, int index, Map<String, dynamic> data) {
    var dx = 0.0;
    var dy = 0.0;
    var del = 1.5;

    dy = value * itemH;

    return Transform.translate(
      offset: Offset(dx, dy),
      child: Container(
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
            padding: EdgeInsets.symmetric(horizontal: kScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: design.itemPadding / 2),
                Padding(
                  padding: EdgeInsets.only(
                      left: design.itemPadding * 0.5,
                      right: design.itemPadding * 0.5),
                  child: Text(
                    data['c'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: design.itemPadding / 2),
                Padding(
                  padding: EdgeInsets.only(
                      left: design.itemPadding * 0.5,
                      right: design.itemPadding * 0.5),
                  child: Text(
                    '----- ${data['d']}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: design.itemPadding / 2),
                const Divider(height: 0.5),
                SizedBox(height: design.itemPadding / 2),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: data['ls'].map<Widget>((e) {
                      Widget c;
                      var iconSize = 24.0;
                      switch (e['n'].toString().toLowerCase()) {
                        case 'android':
                          c = Icon(
                            Icons.android_rounded,
                            size: iconSize,
                            color: Colors.black45,
                          );
                          break;
                        case 'ios':
                          c = Image.asset(
                            Assets.assetLogoapple,
                            width: iconSize,
                            height: iconSize,
                            color: Colors.black45,
                          );
                          break;
                        case 'website':
                        default:
                          c = Icon(
                            Icons.forward,
                            size: iconSize,
                            color: Colors.black45,
                          );
                          break;
                      }
                      return buildCircleButton(
                        child: c,
                        onPressed: () {
                          html.window.open(e['l'], e['n']);
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: design.itemPadding / 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
