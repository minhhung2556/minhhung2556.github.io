// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:minhhung2556/common/flat_elevated_button.dart';
import 'package:minhhung2556/common/res.dart';
import 'package:minhhung2556/common/ui_utils.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/generated/assets.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  late Size _screenSize;
  double _scrollOffset = 0.0;
  double _page1Value = 0;
  double _page2Value = 0;
  double _page3Value = 0;
  double _page4Value = 0;
  double _page5Value = 0;

  double get _screenH => _screenSize.height;

  double get _screenW => _screenSize.width;

  bool get _isPortrait => _screenW < _screenH;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: _scrollOffset);
    _scrollController.addListener(() {
      var o = _scrollOffset = _scrollController.offset;
      _page1Value = max(0.0, min(1.0, o / _screenH));
      _page2Value = max(0.0, min(1.0, (o - _screenH) / _screenH));
      _page3Value = max(0.0, min(1.0, (o - _screenH * 2) / (_screenH)));
      _page4Value = max(0.0, min(1.0, (o - _screenH * 4) / (_screenH)));
      _page5Value = max(0.0, min(1.0, (o - _screenH * 6) / (_screenH)));

      /*print(
          '_MyHomePageState.initState: _scrolledPageCount=$_scrolledPageCount');
      print(
          '_MyHomePageState.initState: _page1Value=${_page1Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page2Value=${_page2Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page3Value=${_page3Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page4Value=${_page4Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page5Value=${_page5Value.toStringAsFixed(2)}');*/
      setState(() {});
    });

    //FIXME test
    // Future.delayed(Duration(milliseconds: 500), () {
    //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kDarkestColor,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          children: [
            _buildPage1(),
            _buildPage2(),
            _buildPage3(),
            _buildPage4(),
            _buildPage5(),
            _buildPage6(),
            SizedBox(
              height: _screenH * 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage6() {
    var av = min(1.0, _page5Value + 0.7);
    var dy = _page5Value * _screenH +
        _screenH * 3 +
        -(1 - av) * _screenH -
        av * _screenH;

    return Transform.translate(
      offset: Offset(0, dy),
      child: Container(
        height: _screenH / 5,
        child: Card(
          color: kCardColor,
          elevation: 0.0,
          margin: const EdgeInsets.all(kScreenPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          child: Center(
            child: Stack(
              children: [
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: kCopyrightData[0],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white38,
                          ),
                        ),
                        TextSpan(
                          text: kCopyrightData[1],
                          style: TextStyle(
                            fontSize: 16,
                            color: kLightestColor,
                          ),
                        ),
                        TextSpan(
                          text: kCopyrightData[2],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white38,
                          ),
                        ),
                        TextSpan(
                          text: kCopyrightData[3],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white38,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: buildFlatButton(
                            child: Text(
                              kCopyrightData[4],
                              style: TextStyle(
                                fontSize: 12,
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
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white38,
                          ),
                        ),
                        TextSpan(
                          text: kCopyrightData[7],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white38,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: buildFlatButton(
                              child: Text(
                            kCopyrightData[8],
                            style: TextStyle(
                              fontSize: 12,
                              color: kLightestColor,
                            ),
                          )),
                        ),
                        TextSpan(
                          text: kCopyrightData[9],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, (-36 - kItemPadding * 1.5 * 2) * 0.8),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: kAccentColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: kItemPadding * 1.5,
                          horizontal: kItemPadding / 2),
                      child: Icon(
                        Icons.upgrade,
                        size: 36,
                        color: kLightestColor,
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
  }

  Widget _buildPage5() {
    var av = min(1.0, _page5Value + 0.7);
    var dy = _page5Value * _screenH +
        _screenH * 3 +
        -(1 - av) * _screenH -
        av * _screenH;

    var dx = _screenW * (1 - _page5Value);
    var avaDx = _screenW * (_page5Value - 1) - dx;
    var socialDy = _screenH * (1 - _page5Value);

    return Transform.translate(
      offset: Offset(0, dy),
      child: Container(
        color: kDarkestColor,
        width: _screenW,
        height: _screenH,
        child: Column(
          children: [
            Expanded(child: Container()),
            Transform.translate(
              offset: Offset(dx, 0),
              child: Card(
                color: kCardColor,
                elevation: 0.0,
                margin: const EdgeInsets.all(kScreenPadding),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: kScreenPadding),
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(avaDx, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kScreenPadding),
                          child: Image.asset(
                            Assets.assetAvatar1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: kScreenPadding),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: kScreenPadding),
                          Text(
                            "Drop A Line",
                            style: TextStyle(fontSize: 26, color: Colors.white),
                          ),
                          const SizedBox(height: kScreenPadding / 2),
                          Icon(
                            Icons.stacked_line_chart,
                            size: 24,
                            color: kAccentColor,
                          ),
                          const SizedBox(height: kScreenPadding),
                          Transform.translate(
                            offset: Offset(-kScreenPadding / 2 - dx,
                                kSocialIconSize / 2 + socialDy),
                            child: Container(
                              color: Colors.black45,
                              child: Transform.translate(
                                offset: Offset(
                                    kScreenPadding, -kSocialIconSize / 2),
                                child: Container(
                                  color: Colors.white30,
                                  child: Wrap(
                                    children: kSocialData
                                        .map<Widget>((e) => buildCircleButton(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    kItemPadding),
                                                child: Image.asset(
                                                  e['i'],
                                                  width: kSocialIconSize,
                                                  height: kSocialIconSize,
                                                ),
                                              ),
                                              onPressed: () {
                                                html.window.open(e['l'], '');
                                              },
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: kScreenPadding),
                        ],
                      ),
                    ),
                    const SizedBox(width: kScreenPadding),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget _buildPage1() {
    var av = _page1Value * 3;
    var dx = av * _screenW / 2;
    return Transform.translate(
      offset: Offset(0, _page1Value * _screenH),
      child: Container(
        color: kColorTween12.transform(av),
        width: _screenW,
        height: _screenH,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: kScreenPadding),
            Expanded(
              child: Transform.translate(
                offset: Offset(-dx, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            shadows: [kBoxShadow],
                          ),
                          children: [
                            TextSpan(
                              text: "Hi! I'm ",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: kMyName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      kMyTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(width: kScreenPadding * 2),
            Expanded(
              child: Transform.translate(
                offset: Offset(dx, 0),
                child: ShadowWidget(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                    child: Opacity(
                      opacity: max(0.0, 1 - _page1Value * 2),
                      child: Image.asset(
                        Assets.assetAvatar,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: kScreenPadding),
          ],
        ),
      ),
    );
  }

  Widget _buildPage2() {
    var av = min(1.0, _page1Value * 2 - 1);
    return Transform.translate(
      offset: Offset(
          0, -_screenH + _page1Value * _screenH + _page2Value * _screenH),
      child: Transform.scale(
        scale: 1 + _page2Value * 2,
        child: Opacity(
          opacity: 1 - _page2Value,
          child: Container(
            height: _screenH,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: kScreenPadding),
                Expanded(
                  child: Opacity(
                    opacity: max(0.0, min(1.0, av)),
                    child: Card(
                      color: kCardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(kScreenPadding),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: kSummaryData[0],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: kLightestColor,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.wifi_tethering,
                                  color: kAccentColor,
                                ),
                              ),
                              TextSpan(
                                text: kSummaryData[1],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: kLightestColor,
                                ),
                              ),
                              TextSpan(
                                text: kSummaryData[2],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: kScreenPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPage3() {
    var dy = _page3Value * _screenH -
        _page1Value * _screenH +
        _page2Value * _screenH;

    return Transform.translate(
      offset: Offset(0, dy),
      child: Opacity(
        opacity: min(1.0, _page3Value),
        child: Container(
          color: kDarkestColor,
          height: _screenH,
          width: _screenW,
          child: Transform.scale(
            scale: min(1.0, 0.5 + _page3Value),
            origin: Offset(0, dy / 2),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Skills",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: kLightestColor,
                  ),
                ),
                const SizedBox(height: kScreenPadding),
                Wrap(
                  children: List.generate(kSkillData.length,
                      (index) => _buildPage3Item(index, kSkillData[index])),
                  spacing: kItemPadding,
                  runSpacing: kItemPadding,
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPage3Item(int index, Map<String, dynamic> data) {
    var av = min(1.0, _page3Value + 0.1);

    var itemW = (_screenW - kScreenPadding * 4) / 3;
    var itemH = (_screenH - kScreenPadding * 6 - 40) / 2;

    var dx = 0.0;
    var dy = 0.0;
    var del = 2;

    if (index == 0) {
      var gap = _screenW;
      dx = -gap + min(1.0, av) * gap;
    } else if (index == 1) {
      var gap = _screenW;
      dx = -gap + min(1.0, av * del) * gap;
    } else if (index == 2) {
      var gap = _screenW;
      dx = -gap + min(1.0, av * del * del) * gap;
    } else if (index == 5) {
      var gap = _screenH;
      dy = gap - av * gap;
    } else if (index == 4) {
      var gap = _screenH;
      dy = gap - min(1.0, av * del) * gap;
    } else if (index == 3) {
      var gap = _screenH;
      dy = gap - min(1.0, av * del * del) * gap;
    }

    return Transform.translate(
      offset: Offset(dx, dy),
      child: Container(
        width: itemW,
        height: itemH,
        decoration: ShapeDecoration(
          color: kItemColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusSmall),
            side: BorderSide(
              color: Colors.white10,
              width: 2,
            ),
          ),
        ),
        padding: EdgeInsets.all(kItemPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data['i'] is String
                ? Image.asset(
                    data['i'],
                    width: kIconSize,
                    height: kIconSize,
                    color: kLightestColor,
                    colorBlendMode: BlendMode.srcATop,
                  )
                : Icon(
                    data['i'],
                    color: kLightestColor,
                    size: kIconSize,
                  ),
            const SizedBox(height: kItemPadding),
            Text(
              data['t'],
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: kAccentColor,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: kItemPadding),
            Expanded(
              child: Text(
                data['d'],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.white70,
                ),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage4() {
    var av = min(1.0, _page4Value + 0.7);
    var dy = _page4Value * _screenH +
        _page1Value * _screenH +
        _page2Value * _screenH +
        -(1 - av) * _screenH -
        av * _screenH;

    var itemW =
        ((min(_screenW, _screenH) - kScreenPadding * 2) / 2.5).roundToDouble();
    var itemH = (itemW * 1.7).roundToDouble();

    return Transform.translate(
      offset: Offset(0, dy),
      child: Opacity(
        opacity: max(0.0, min(1.0, av)),
        child: Container(
          color: kDarkestColor,
          height: _screenH,
          width: _screenW,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: _screenH / 2,
                  color: kLightestColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Works",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      color: kDarkestColor,
                    ),
                  ),
                  const SizedBox(height: kScreenPadding),
                  SizedBox(
                    height: itemH,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: kWorksData.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? kItemPadding : 0,
                            right: kItemPadding),
                        child: _buildPage4Item(itemW - kItemPadding, itemH,
                            index, kWorksData[index]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage4Item(
      double itemW, double itemH, int index, Map<String, dynamic> data) {
    var dx = 0.0;
    var dy = 0.0;
    var del = 1.5;

    var gap = _screenH;
    dy = gap -
        max(
                0.0,
                min(1.0,
                    _page4Value * pow(del, kWorksData.length - index - 1))) *
            gap;

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
            width: itemW,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: kItemPadding,
                  height: itemW / 2,
                  color: kDarkestColor,
                ),
                Expanded(
                  child: Container(
                    color: kLightestColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: kItemPadding / 2),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: kItemPadding * 0.5,
                              right: kItemPadding * 0.5),
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
                        const SizedBox(height: kItemPadding / 2),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: kItemPadding * 0.5,
                              right: kItemPadding * 0.5),
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
                        const SizedBox(height: kItemPadding / 2),
                        const Divider(height: 0.5),
                        const SizedBox(height: kItemPadding / 2),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: kItemPadding, right: kItemPadding),
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: data['ls'].map<Widget>((e) {
                                Widget c;
                                switch (e['n'].toString().toLowerCase()) {
                                  case 'android':
                                    c = Icon(
                                      Icons.android_rounded,
                                      size: 24,
                                      color: Colors.black45,
                                    );
                                    break;
                                  case 'ios':
                                    c = Image.asset(
                                      Assets.assetLogoapple,
                                      width: 24,
                                      height: 24,
                                      color: Colors.black45,
                                    );
                                    break;
                                  case 'website':
                                  default:
                                    c = Icon(
                                      Icons.forward,
                                      size: 24,
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
                        ),
                        const SizedBox(height: kItemPadding / 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
