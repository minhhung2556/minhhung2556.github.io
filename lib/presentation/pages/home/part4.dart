import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../index.dart';

class Part4 extends StatefulWidget {
  final ScrollController scrollController;
  final Profile data;
  const Part4({
    Key? key,
    required this.scrollController,
    required this.data,
  }) : super(key: key);

  @override
  State<Part4> createState() => _Part4State();
}

class _Part4State extends State<Part4> {
  final backgroundOpacityTween = TweenSequence([
    TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1), weight: 0.9),
    TweenSequenceItem(tween: Tween<double>(begin: 1, end: 1), weight: 0.1),
  ]);
  @override
  void initState() {
    widget.scrollController.addListener(() {
      if (!mounted || !widget.scrollController.hasClients) return;

      // setState(() {});
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
    final avatarY = (screenSize.height - avatarH) * 0.5;
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
        Padding(
          padding: MyDimensions.screenPadding * 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'LET\'S\nCONNECT',
                    style: MyStyles.hugeNickNameTextStyle,
                  ),
                  Expanded(
                    child: Padding(
                      padding: MyDimensions.screenPadding,
                      child: Column(
                        children: [
                          MyWidgets.divider,
                          MyWidgets.componentMarginBox,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Minding a project? ', style: MyStyles.headlineTextStyle),
                              TextButton(
                                child: Text(
                                  'CONTACT ME',
                                  style: MyStyles.contactMeTextStyle,
                                ),
                                style: MyStyles.menuButtonStyle,
                                onPressed: () {
                                  //TODO
                                },
                              ),
                              MyWidgets.invisibleExpandedBox,
                              ...widget.data.contactInfo!.websites!.map(
                                (e) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      child: Text(
                                        e.name!,
                                        style: MyStyles.menuButtonTextStyle,
                                      ),
                                      style: MyStyles.menuButtonStyle,
                                      onPressed: () {
                                        launchUrl(Uri.parse(e.url));
                                      },
                                    ),
                                    widget.data.contactInfo!.websites!.indexOf(e) <
                                            widget.data.contactInfo!.websites!.length - 1
                                        ? Text(',', style: MyStyles.menuButtonTextStyle)
                                        : MyWidgets.empty,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
