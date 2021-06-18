// ignore: avoid_web_libraries_in_flutter
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:minhhung2556/v1/common/design.dart';
import 'package:minhhung2556/v1/pages/page1.dart';
import 'package:minhhung2556/v1/pages/page2.dart';
import 'package:minhhung2556/v1/pages/page3.dart';
import 'package:minhhung2556/v1/pages/page4.dart';

class HomePageV1 extends StatefulWidget {
  @override
  _HomePageV1State createState() => _HomePageV1State();
}

class _HomePageV1State extends State<HomePageV1> with TickerProviderStateMixin {
  late ScrollController _scrollController;

  late Size screenSize;
  double scrollOffset = 0.0;
  double page1Value = 0;
  double page2Value = 0;
  double page3Value = 0;
  double page4Value = 0;

  double get screenH => screenSize.height;

  double get screenW => screenSize.width;

  late AnimationController goToTopAnimationController;

  late ScrollController _workSC;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: scrollOffset);
    _scrollController.addListener(() {
      var o = scrollOffset = _scrollController.offset;
      page1Value = max(0.0, min(1.0, o / screenH));
      page2Value = max(0.0, min(1.0, (o - screenH) / screenH));
      page3Value = max(0.0, min(1.0, (o - screenH * 2) / screenH));
      page4Value = max(0.0, min(1.0, (o - screenH * 3) / (screenH)));

      /*
      print(
          '_MyHomePageState.initState: _page1Value=${_page1Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page2Value=${_page2Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page3Value=${_page3Value.toStringAsFixed(2)}');
      print(
          '_MyHomePageState.initState: _page4Value=${_page4Value.toStringAsFixed(2)}');
      */

      if (page4Value == 1.0) {
        Future.delayed(Duration(milliseconds: 100), () {
          goToTopAnimationController.repeat();
        });
      }

      if (page3Value >= 1.0) {
        _workSC.jumpTo(page4Value * _workSC.position.maxScrollExtent);
      }

      setState(() {});
    });

    //FIXME test
    // Future.delayed(Duration(milliseconds: 500), () {
    //   _scrollController.jumpTo(screenH * 5);
    // });

    goToTopAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    goToTopAnimationController.addListener(() {
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
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kDarkestColor,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          children: [
            Page1(
              value: page1Value,
            ),
            Page2(
              value: page2Value,
              page1Value: page1Value,
            ),
            Page3(
              value: page3Value,
              page1Value: page1Value,
              page2Value: page2Value,
              page4Value: page4Value,
              controller: _workSC,
            ),
            Page4(
              value: page4Value,
              page1Value: page1Value,
              page2Value: page2Value,
              page3Value: page3Value,
              animationController: goToTopAnimationController,
            ),
            SizedBox(
              height: screenH * 2,
            ),
          ],
        ),
      ),
    );
  }
}
