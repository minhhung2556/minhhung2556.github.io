import 'dart:math';

import 'package:flutter/material.dart';

import '../../../index.dart';

class Part1 extends StatefulWidget {
  final ScrollController scrollController;
  final Profile data;

  const Part1({
    Key? key,
    required this.scrollController,
    required this.data,
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
    final avatarW = screenSize.width / 3;
    final avatarH = avatarW;
    final avatarX = MyDimensions.screenPadding.left;
    final avatarY = screenSize.height - avatarH;
    final aboutX = avatarX + avatarW + MyDimensions.screenPadding.left;
    final aboutW = screenSize.width - aboutX - MyDimensions.screenPadding.right;
    return Stack(
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
        Row(
          children: [
            Transform.translate(
              offset: Offset(avatarX, avatarY),
              child: SizedBox(
                width: avatarW,
                height: avatarH,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      Assets.assetAvatar1,
                      fit: BoxFit.cover,
                    ),
                    FittedBox(
                      child: Text(
                        '${widget.data.nickName!.replaceAll(' ', '\n').toUpperCase()}',
                        style: MyStyles.hugeNickNameTextStyle,
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: MyDimensions.screenPadding.copyWith(top: avatarY / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello there!',
                      style: MyStyles.heading2TextStyle,
                    ),
                    Text(
                      widget.data.about!.replaceAll('\\n', '\n'),
                      style: MyStyles.headlineTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: MyDimensions.screenPadding,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${widget.data.lastName} ${widget.data.surName} ${widget.data.firstName}',
                          style: MyStyles.nameTextStyle),
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
      ],
    );
  }
}
