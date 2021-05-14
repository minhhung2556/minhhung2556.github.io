import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  var _scrollController = ScrollController();
  late Size _screenSize;
  double _page1Value = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      _page1Value =
          max(0.0, min(1.0, _scrollController.offset / _screenSize.height));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          children: [
            _buildPage1(),
            Container(
              height: _screenSize.height * 6,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPage1() {
    return Transform.translate(
      offset: Offset(0, _page1Value * _screenSize.height),
      child: SizedBox(
        height: _screenSize.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: _kScreenPadding),
            Expanded(
              child: Transform.translate(
                offset: Offset(-_page1Value * _screenSize.width / 2, 0),
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
                      "\nMaking application development be more romantic.",
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
                offset: Offset(_page1Value * _screenSize.width / 2, 0),
                child: ShadowWidget(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "avatar.jpeg",
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
}
