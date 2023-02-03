import 'dart:math';

import 'package:flutter/material.dart';

import '../../../index.dart';

class Part1 extends StatefulWidget {
  final ScrollController scrollController;
  const Part1({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<Part1> createState() => _Part1State();
}

class _Part1State extends State<Part1> {
  final backgroundOpacityTween = TweenSequence([
    TweenSequenceItem(tween: Tween<double>(begin: 1, end: 1), weight: 0.9),
    TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0), weight: 0.1),
  ]);
  @override
  void initState() {
    widget.scrollController.addListener(() {
      if (!mounted || !widget.scrollController.hasClients) return;

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final backgroundW = screenSize.width;
    final backgroundH = screenSize.width;
    final parentScrollOffset = widget.scrollController.offset;
    final parentMaxScrollExtend = widget.scrollController.position.hasContentDimensions
        ? widget.scrollController.position.maxScrollExtent
        : backgroundH;
    final backgroundDy = parentScrollOffset * 0.7;
    final backgroundOpacity = min(1.0, max(0.0, parentScrollOffset / parentMaxScrollExtend));
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              children: [
                Transform.translate(
                  offset: Offset(0, backgroundDy),
                  child: Opacity(
                    opacity: backgroundOpacityTween
                        .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn))
                        .transform(backgroundOpacity),
                    child: Image.asset(
                      Assets.assetHomepageBackground,
                      width: backgroundW,
                      height: backgroundH,
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                  ),
                ),
                Padding(
                  padding: MyDimensions.screenPadding,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Luong Do Minh Hung', style: MyStyles.nameTextStyle),
                          MyWidgets.invisibleExpandedBox,
                          TextButton(
                            child: Text(
                              'works',
                              style: MyStyles.menuButtonTextStyle,
                            ),
                            style: MyStyles.menuButtonStyle,
                            onPressed: () {
                              //TODO
                            },
                          ),
                          Text(',', style: MyStyles.menuButtonTextStyle),
                          TextButton(
                            child: Text(
                              'about',
                              style: MyStyles.menuButtonTextStyle,
                            ),
                            style: MyStyles.menuButtonStyle,
                            onPressed: () {
                              //TODO
                            },
                          ),
                          Text(',', style: MyStyles.menuButtonTextStyle),
                          TextButton(
                            child: Text(
                              'contact',
                              style: MyStyles.menuButtonTextStyle,
                            ),
                            style: MyStyles.menuButtonStyle,
                            onPressed: () {
                              //TODO
                            },
                          ),
                        ],
                      ),
                      MyWidgets.componentMarginBox,
                      MyWidgets.divider,
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: MyDimensions.screenPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ROMANTIC\nDEVELOPER ',
                    style: MyStyles.hugeNickNameTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  Expanded(
                    child: Text(
                      '''The first time when I started using the computer, thank to the Windows 95 Introduction book, I was in 3rd grade. I realized that becoming a software developer was my lifelong dream.
After more than 9 years of working, with perseverance, effort, and passion in mobile application development, I have contributed to building the success of the great products that I participate in and achieved many valuable achievements on my career path.
Build super apps, develop core functionalities of great products, integrate with multiple partners, build infrastructure, train and develop teams, support community, and mentor many young developers who got many achievements on their career path.

“Keep everything simple in mind. Unidirectional workflow for code and life”.''',
                      style: MyStyles.headlineTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
