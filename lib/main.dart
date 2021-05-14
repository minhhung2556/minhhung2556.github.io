import 'dart:html' as html;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:minhhung2556/common/flat_elevated_button.dart';
import 'package:minhhung2556/common/ui_utils.dart';
import 'package:minhhung2556/generated/assets.dart';

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
const _kBorderRadius = 4.0;
const _kIconSize = 32.0;
const _kItemColor = const Color(0x08ffffff);
final _kColorTween12 = ColorTween(begin: Colors.white, end: Colors.black);
const _kSocialIconSize = 30.0;

const _kMyName = "Lương Đỗ Minh Hưng";
const _kMyTitle =
    "\nA Romantic Mobile Application/Game developer, a friendly daddy, a motivating leader, a funny friend, and a handsome husband. :D";
const _kSummaryData = <String>[
  "Making The Mobile Application Development be more romantic is my passion.\n\n",
  "\n\nBased in Ho Chi Minh City, I code and design things for Mobile.\n\n",
  "I have a demonstrated history of working in Mobile Development. With more than 8 years of working experience and deep knowledge in mobile as well as team management skills, I believe I will contribute my best to my next great product.",
];
const _kSkillData = <Map<String, dynamic>>[
  {
    'i': Assets.assetLogoflutter,
    't': 'Flutter',
    'd':
        "Researched and learned Flutter since May 2018, hands on developing a lot of big features in one of biggest E-commerce in Viet Nam, at Sendo. Leaded and trained a strong Flutter Dev Team at that company."
  },
  {
    'i': Icons.android,
    't': 'Android',
    'd':
        "Started working on Android since 2013, hands on developing and releasing some Android applications, such as Social Network, Payment SDK. And then started leading a Android team since 2015."
  },
  {
    'i': Assets.assetLogoapple,
    't': 'iOS',
    'd':
        "Learned since 2014, but until 2019 I've released my first iOS application. I'm not have many experiences in iOS development, but know how to work with it :D."
  },
  {
    'i': Icons.mobile_friendly,
    't': 'Mobile',
    'd':
        "Mobile Application development is my passion. Since the first time I owned a smartphone in 2008, my first java mobile phone. In 2012, by self learning in J2ME development. I got my first job by my Dictionary App and Pikachu Kawai game."
  },
  {
    'i': Icons.people,
    't': 'Leadership',
    'd':
        "Leading people is one of my best. Every group I'm in to play or work, everything go on by my requests."
  },
  {
    'i': Icons.model_training,
    't': 'Others',
    'd':
        "Many of my team members and friends are a key member/leader/trainer who got high performance in work. That's is my happiness. Helping people grow up and make life better."
  },
];
const _kWorksData = <Map<String, dynamic>>[
  {
    'c': 'HomeCredit.vn',
    'd': '12/2020 - now',
    't': 'Senior Mobile Developer',
    'i': 'https://hoanhap.vn/uploads/photos/40/2-9/5f6ea66fed9fe.jpg',
    'ls': [
      {
        'n': 'Android',
        'l': 'https://play.google.com/store/apps/details?id=vn.homecredit.hcvn',
      },
      {
        'n': 'iOS',
        'l': 'https://apps.apple.com/vn/app/home-credit-vietnam/id1167077808',
      },
      {
        'n': 'Website',
        'l': 'https://homecredit.vn',
      },
    ],
  },
  {
    'c': 'Sendo.vn',
    'd': '05/2018 - 12/2020',
    't': 'Mobile Team Leader',
    'i':
        'https://play-lh.googleusercontent.com/1vYJL7AazCUYnp317d4dWb-3Dfa9Mv5IPSPnQh88UAK8ZQE8LW9XkVRpL-6x440Zcg=w3584-h2018-rw',
    'ls': [
      {
        'n': 'Android',
        'l': 'https://play.google.com/store/apps/details?id=com.sendo',
      },
      {
        'n': 'iOS',
        'l': 'https://apps.apple.com/VN/app/id940313804?mt=8',
      },
      {
        'n': 'Website',
        'l': 'https://sendo.vn',
      },
    ],
  },
  {
    'c': 'SenPay.vn',
    'd': '05/2017 - 05/2018',
    't': 'Android Team Leader',
    'i':
        'https://play-lh.googleusercontent.com/29JuGgFCHDnSn_yI3zW68B2U9Qh6LAjuDuu9ZUoovHBfIpKqi8cUhsmmZvs7mKi2GCyI=w3584-h2018-rw',
    'ls': [
      {
        'n': 'Android',
        'l': 'https://play.google.com/store/apps/details?id=vn.senpay',
      },
      {
        'n': 'iOS',
        'l': 'https://apps.apple.com/vn/app/senpay-vn/id1276466893',
      },
      {
        'n': 'Website',
        'l': 'https://senpay.vn',
      },
    ],
  },
  {
    'c': 'iCareBenefits',
    'd': '06/2015 - 06/2016',
    't': 'Android Team Leader',
    'i':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShVYoMxykZG_7pKFaj-_61crTPgo0cp5869-ToLROHZvQt3OG9zUWKbaM2jdwPBMlBoBE&usqp=CAU',
    'ls': [
      {
        'n': 'Android',
        'l': 'https://play.google.com/store/apps/dev?id=6752486900782105869',
      },
      {
        'n': 'iOS',
        'l': 'https://apps.apple.com/vn/developer/mobivi/id1097030106',
      },
      {
        'n': 'Website',
        'l': 'https://icarebenefits.vn',
      },
    ],
  },
  {
    'c': 'ME Corp',
    'd': '06/2012 - 06/2015',
    't': 'Senior Game Developer',
    'i':
        'http://static.gamehub.vn/img/files/2015/08/17/gamehubvn-diem-mat-gmo-dong-cua-2015.jpg',
    'ls': [
      {
        'n': 'Android',
        'l': 'https://mecorp.vn',
      },
      {
        'n': 'iOS',
        'l': 'https://mecorp.vn',
      },
      {
        'n': 'Website',
        'l': 'https://mecorp.vn',
      },
    ],
  },
];

const _kSocialData = <Map<String, dynamic>>[
  {
    'i': Assets.assetIcMedium,
    'l': 'https://minhhung2556.medium.com/',
  },
  {
    'i': Assets.assetIcDartpub,
    'l': 'https://pub.dev/packages?q=email%3Aminhhung2556%40gmail.com',
  },
  {
    'i': Assets.assetIcGitlab,
    'l': 'https://gitlab.com/romantic_project',
  },
  {
    'i': Assets.assetIcGithub,
    'l': 'https://github.com/minhhung2556',
  },
  {
    'i': Assets.assetIcLinkedin,
    'l': 'https://www.linkedin.com/in/hungldm/',
  },
  {
    'i': Assets.assetIcFacebook,
    'l': 'https://www.facebook.com/luongdominhhung',
  },
  {
    'i': Assets.assetIcGmail,
    'l': 'mailto:minhhung2556@gmail.com',
  },
  {
    'i': Assets.assetIcSkype,
    'l': 'https://join.skype.com/invite/aQ1WVNVCMHIa',
  },
];

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  late Size _screenSize;
  double _scrollOffset = 0.0;
  double _page1Value = 0;
  double _page2Value = 0;
  double _page3Value = 0;
  double _page4Value = 0;
  double _page5Value = 0;
  int _scrolledPageCount = 0;

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

      _scrolledPageCount = o ~/ _screenH;
      print(
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
          '_MyHomePageState.initState: _page5Value=${_page5Value.toStringAsFixed(2)}');
      setState(() {});
    });

    //FIXME test
    // Future.delayed(Duration(milliseconds: 500), () {
    //   _scrollController
    //       .jumpTo(_scrollController.position.maxScrollExtent - _screenH);
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

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
          color: Color(0xff111111),
          elevation: 0.0,
          margin: const EdgeInsets.all(_kScreenPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_kBorderRadius),
          ),
          child: Center(
            child: Stack(
              children: [
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        shadows: [kBoxShadow],
                      ),
                      children: [
                        TextSpan(
                          text: " © 2021 ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white38,
                          ),
                        ),
                        TextSpan(
                          text: _kMyName,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: ". All rights reserved.\n\n",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white38,
                          ),
                        ),
                        TextSpan(
                          text: "Thank ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white38,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: buildFlatButton(
                            child: Text(
                              'Md Sojon Islam',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              html.window.open(
                                  'https://www.behance.net/sojonatbe', '');
                            },
                          ),
                        ),
                        TextSpan(
                          text: " for an awesome portfolio design.\n",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white38,
                          ),
                        ),
                        TextSpan(
                          text: "Thank ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white38,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: buildFlatButton(
                              child: Text(
                            'Apple Inc',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )),
                        ),
                        TextSpan(
                          text: " for the idea.",
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
                  offset: Offset(0, (-36 - _kItemPadding * 1.5 * 2) * 0.8),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: Colors.cyan,
                      padding: const EdgeInsets.symmetric(
                          vertical: _kItemPadding * 1.5,
                          horizontal: _kItemPadding / 2),
                      child: Icon(
                        Icons.upgrade,
                        size: 36,
                        color: Colors.white,
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
        color: Colors.black,
        width: _screenW,
        height: _screenH,
        child: Column(
          children: [
            Expanded(child: Container()),
            Transform.translate(
              offset: Offset(dx, 0),
              child: Card(
                color: Color(0xff111111),
                elevation: 0.0,
                margin: const EdgeInsets.all(_kScreenPadding),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_kBorderRadius),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: _kScreenPadding),
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(avaDx, 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: _kScreenPadding),
                          child: Image.network(
                            "https://scontent-xsp1-3.xx.fbcdn.net/v/t1.6435-9/175700739_4029854070391181_1311522878777132494_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=Xo7rcXcs5SwAX_LY9_u&_nc_ht=scontent-xsp1-3.xx&oh=aff62b59af8967e9174f826ca7999350&oe=60C4179A",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: _kScreenPadding),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: _kScreenPadding),
                          Text(
                            "Drop A Line",
                            style: TextStyle(fontSize: 26, color: Colors.white),
                          ),
                          const SizedBox(height: _kScreenPadding / 2),
                          Icon(
                            Icons.stacked_line_chart,
                            size: 24,
                            color: Colors.cyan,
                          ),
                          const SizedBox(height: _kScreenPadding / 2),
                          Transform.translate(
                            offset: Offset(-_kScreenPadding / 2 - dx,
                                _kSocialIconSize / 2 + socialDy),
                            child: Container(
                              color: Colors.black45,
                              child: Transform.translate(
                                offset: Offset(
                                    _kScreenPadding, -_kSocialIconSize / 2),
                                child: Container(
                                  color: Colors.white30,
                                  child: Wrap(
                                    children: _kSocialData
                                        .map<Widget>((e) => buildCircleButton(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    _kItemPadding),
                                                child: Image.asset(
                                                  e['i'],
                                                  width: _kSocialIconSize,
                                                  height: _kSocialIconSize,
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
                          const SizedBox(height: _kScreenPadding),
                        ],
                      ),
                    ),
                    const SizedBox(width: _kScreenPadding),
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
        color: _kColorTween12.transform(av),
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
                              text: "Hi! I'm ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: _kMyName,
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
                      _kMyTitle,
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
                      color: Color(0xff111111),
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
                                text: _kSummaryData[0],
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
                                text: _kSummaryData[1],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: _kSummaryData[2],
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

  Widget _buildPage3() {
    var dy = _page3Value * _screenH -
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
                  children: List.generate(_kSkillData.length,
                      (index) => _buildPage3Item(index, _kSkillData[index])),
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
    var av = _page3Value;
    var itemW = (_screenW - _kScreenPadding * 4) / 3;
    var itemH = itemW * (_isPortrait ? 1.7 : 0.56);

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
        height: itemH,
        decoration: ShapeDecoration(
          color: _kItemColor,
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
                    width: _kIconSize,
                    height: _kIconSize,
                    color: Colors.white,
                    colorBlendMode: BlendMode.srcATop,
                  )
                : Icon(
                    data['i'],
                    color: Colors.white,
                    size: _kIconSize,
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

    var itemW = ((_screenW - _kScreenPadding * 2) / 2.5).roundToDouble();
    var itemH = (itemW * 1.7).roundToDouble();

    return Transform.translate(
      offset: Offset(0, dy),
      child: Opacity(
        opacity: max(0.0, min(1.0, av)),
        child: Container(
          color: Colors.black,
          height: _screenH,
          width: _screenW,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: _screenH / 2,
                  color: Colors.white,
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
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: _kScreenPadding),
                  SizedBox(
                    height: itemH,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _kWorksData.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? _kItemPadding : 0,
                            right: _kItemPadding),
                        child: _buildPage4Item(itemW - _kItemPadding, itemH,
                            index, _kWorksData[index]),
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
                    _page4Value * pow(del, _kWorksData.length - index - 1))) *
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
            image: Image.network(
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
                  width: _kItemPadding,
                  height: itemW / 2,
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: _kItemPadding / 2),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: _kItemPadding * 0.5,
                              right: _kItemPadding * 0.5),
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
                        const SizedBox(height: _kItemPadding / 2),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: _kItemPadding * 0.5,
                              right: _kItemPadding * 0.5),
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
                        const SizedBox(height: _kItemPadding / 2),
                        const Divider(height: 0.5),
                        const SizedBox(height: _kItemPadding / 2),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: _kItemPadding, right: _kItemPadding),
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
                        const SizedBox(height: _kItemPadding / 2),
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
