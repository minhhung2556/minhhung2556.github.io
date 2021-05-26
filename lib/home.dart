// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:minhhung2556/common/flat_elevated_button.dart';
import 'package:minhhung2556/common/res.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/generated/assets.dart';
import 'package:minhhung2556/pages/page1.dart';
import 'package:minhhung2556/pages/page2.dart';
import 'package:minhhung2556/pages/page3.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
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

  late AnimationController _page6AC;

  late ScrollController _workSC;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: _scrollOffset);
    _scrollController.addListener(() {
      var o = _scrollOffset = _scrollController.offset;
      _page1Value = max(0.0, min(1.0, o / _screenH));
      _page2Value = max(0.0, min(1.0, (o - _screenH) / _screenH));
      _page3Value = max(0.0, min(1.0, (o - _screenH * 2) / _screenH));
      _page4Value = max(0.0, min(1.0, (o - _screenH * 3) / (_screenH)));
      _page5Value = max(0.0, min(1.0, (o - _screenH * 4) / (_screenH)));

      /*print(
          '_MyHomePageState.initState: _page1Value=${_page1Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page2Value=${_page2Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page3Value=${_page3Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page4Value=${_page4Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page5Value=${_page5Value.toStringAsFixed(2)}');*/

      if (_page5Value == 1.0) {
        Future.delayed(Duration(milliseconds: 100), () {
          _page6AC.repeat();
        });
      }

      if (_page4Value > 0.0) {
        var m = _workSC.position.maxScrollExtent;
        var v = min(1.0, max(0, o - _screenH * 4.7) / (_screenH * 0.3));
        _workSC.jumpTo(v * m);
      }

      setState(() {});
    });

    //FIXME test
    // Future.delayed(Duration(milliseconds: 500), () {
    //   _scrollController.jumpTo(MediaQuery.of(context).size.height * 3);
    // });

    _page6AC =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _page6AC.addListener(() {
      setState(() {});
    });

    _workSC = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            Page1(
              value: _page1Value,
            ),
            Page2(
              value: _page2Value,
              page1Value: _page1Value,
            ),
            Page3(
              value: _page3Value,
              page1Value: _page1Value,
              page2Value: _page2Value,
              controller: _workSC,
            ),
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
        constraints: BoxConstraints(minHeight: _screenH / 5),
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            Card(
              color: kCardColor,
              elevation: 0.0,
              margin: const EdgeInsets.all(kScreenPadding),
              shape: RoundedRectangleBorder(
                borderRadius: kBorder,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(kScreenPadding),
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
              ),
            ),
            Transform.translate(
              offset: Offset(0, kScreenPadding * 1.5),
              child: Container(
                color: kAccentColor,
                padding: const EdgeInsets.symmetric(
                    vertical: kItemPadding * 1.5, horizontal: kItemPadding / 2),
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
                  ).animate(_page6AC),
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
                margin: const EdgeInsets.all(kScreenPadding * 2),
                shape: RoundedRectangleBorder(
                  borderRadius: kBorder,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: kScreenPadding * 2),
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(avaDx, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kScreenPadding * 2),
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
                          const SizedBox(height: kScreenPadding * 2),
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
                                    alignment: WrapAlignment.center,
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
                          const SizedBox(height: kScreenPadding * 2),
                        ],
                      ),
                    ),
                    const SizedBox(width: kScreenPadding * 2),
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
}
