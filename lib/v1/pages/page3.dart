import 'package:flutter/material.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/generated/assets.dart';
import 'package:minhhung2556/v1/common/design.dart';
import 'package:minhhung2556/v1/common/flat_elevated_button.dart';
import 'package:minhhung2556/v1/common/res.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: kScreenPadding),
                    child: Text(
                      "Works",
                      style: design.header2Style,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: kWorksData.length,
                  itemBuilder: (context, index) {
                    return SlideTransition(
                      position: AlwaysStoppedAnimation(
                          Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
                              .transform(value)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? design.screenPadding : 0,
                          right: design.screenPadding,
                        ),
                        child: AspectRatio(
                          aspectRatio: 0.75,
                          child:
                              _buildPage4Item(design, index, kWorksData[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage4Item(Design design, int index, Map<String, dynamic> data) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          image: Image.asset(
            data['i'],
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
                    left: design.itemPadding, right: design.itemPadding),
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
                          // html.window.open(e['l'], e['n']);
                          launch(e['l'], webOnlyWindowName: e['n']);
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
