import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:minhhung2556/generated/assets.dart';
import 'package:minhhung2556/utils/ui_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lương Đỗ Minh Hưng',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const _kScreenPadding = 24.0;
const _kItemPadding = 16.0;
const _kBorderRadiusSmall = 8.0;
const _kBorderRadius = 16.0;
const _kSkillDatas = <Map<String, dynamic>>[
  {
    'i': Assets.assetLogoflutter,
    't': 'Flutter',
    'd':
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
  },
  {
    'i': Icons.android,
    't': 'Android',
    'd':
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
  },
  {
    'i': Assets.assetLogoapple,
    't': 'iOS',
    'd':
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
  },
  {
    'i': Icons.mobile_friendly,
    't': 'Mobile',
    'd':
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
  },
  {
    'i': Icons.people,
    't': 'Leadership',
    'd':
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
  },
  {
    'i': Icons.model_training,
    't': 'Others',
    'd':
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
  },
];

class _MyHomePageState extends State<MyHomePage> {
  var _scrollController = ScrollController();
  late Size _screenSize;
  double _page1Value = 0;
  var _colorTween12 = ColorTween(begin: Colors.white, end: Colors.black);
  double _page2Value = 0;
  double _page3Value = 0;

  double get _screenH => _screenSize.height;

  double get _screenW => _screenSize.width;

  @override
  void initState() {
    _scrollController.addListener(() {
      var o = _scrollController.offset;
      _page1Value = max(0.0, min(1.0, o / _screenH));
      _page2Value = max(0.0, min(1.0, (o - _screenH) / _screenH));
      _page3Value = max(0.0, (o - _screenH * 2) / _screenH);

      if (_page1Value < 1.0)
        print(
            '_MyHomePageState.initState: _page1Value=${_page1Value.toStringAsFixed(2)}');
      if (_page2Value < 1.0)
        print(
            '_MyHomePageState.initState: _page2Value=${_page2Value.toStringAsFixed(2)}');
      if (_page3Value > 0.0)
        print(
            '_MyHomePageState.initState: _page3Value=${_page3Value.toStringAsFixed(2)}');
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    // FIXME test a page
    // return Material(child: _buildPage3());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          children: [
            _buildPage1(),
            _buildPage2(),
            _buildPage3(),
            SizedBox(
              height: _screenH * 2,
            ),
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
        color: _colorTween12.transform(av),
        width: _screenW,
        height: _screenH,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: _kScreenPadding),
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
                              text: "I'm   ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: "Lương Đỗ Minh Hưng",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "\nA Mobile Application/Game Developer",
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
            const SizedBox(width: _kScreenPadding * 2),
            Expanded(
              child: Transform.translate(
                offset: Offset(dx, 0),
                child: ShadowWidget(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(_kBorderRadiusSmall),
                    child: Image.asset(
                      Assets.assetAvatar,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: _kScreenPadding),
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
                const SizedBox(width: _kScreenPadding),
                Expanded(
                  child: Opacity(
                    opacity: max(0.0, min(1.0, av)),
                    child: Card(
                      color: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_kBorderRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(_kScreenPadding),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              shadows: [kBoxShadow],
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "Making The Mobile Application Development be more romantic is my passion.\n\n",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.wifi_tethering,
                                  color: Colors.cyan,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "\n\nBased in Ho Chi Minh City, I code and design things for Mobile.\n\n",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "I have a demonstrated history of working in Mobile Development, especially successfully built a strong Flutter Development team and released many key features for one of largest E-commerce in Viet Nam. With more than 8 years of working experience and deep knowledge in mobile as well as team management skills, I believe I will contribute my best to my next great product.",
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
                const SizedBox(width: _kScreenPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get _isPortrait => _screenW < _screenH;

  Widget _buildPage3() {
    //FIXME test
    // _page1Value = _page2Value = 1;

    var dy = _page3Value * _screenH +
        -_screenH -
        _screenH +
        _page1Value * _screenH +
        _page2Value * _screenH;

    return Transform.translate(
      offset: Offset(0, dy),
      child: Opacity(
        opacity: min(1.0, _page3Value),
        child: Container(
          color: Colors.black,
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
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: _kScreenPadding),
                Wrap(
                  children: List.generate(_kSkillDatas.length,
                      (index) => _buildPage3Item(index, _kSkillDatas[index])),
                  spacing: _kItemPadding,
                  runSpacing: _kItemPadding,
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
    var av = _page3Value / 2;
    var itemW = (_screenW - _kScreenPadding * 4) / 3;
    // var itemH = _isPortrait ? (itemW * 4 / 3):itemW ;
    var iconSize = 32.0;

    var dx = 0.0;
    var dy = 0.0;
    var del = 1.5;

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
        decoration: ShapeDecoration(
          color: Color(0x08ffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kBorderRadiusSmall),
            side: BorderSide(
              color: Colors.white10,
              width: 2,
            ),
          ),
        ),
        padding: EdgeInsets.all(_kItemPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data['i'] is String
                ? Image.asset(
                    data['i'],
                    width: iconSize,
                    height: iconSize,
                    color: Colors.white,
                    colorBlendMode: BlendMode.srcATop,
                  )
                : Icon(
                    data['i'],
                    color: Colors.white,
                    size: iconSize,
                  ),
            const SizedBox(height: _kItemPadding),
            Text(
              data['t'],
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.cyan,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: _kItemPadding),
            Text(
              data['d'],
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.white70,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: _isPortrait ? 10 : 4,
            ),
          ],
        ),
      ),
    );
  }
}
