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
    final backgroundDy = parentScrollOffset * 0.8;
    return Stack(
      alignment: Alignment.center,
      children: [
        Stack(
          children: [
            Transform.translate(
              offset: Offset(0, backgroundDy),
              child: Image.asset(
                Assets.assetsHomepageBackground,
                width: backgroundW,
                height: backgroundH,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black38,
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
                kName.replaceAll(' ', '\n').toUpperCase() + ' ',
                style: MyStyles.hugeNickNameTextStyle,
                textAlign: TextAlign.start,
              ),
              Expanded(
                child: Text(
                  'BASED IN ITALY. I HAVE MANY YEARS OF EXPERIENCE IN CONSULTING IN ALL AREAS OF DIGITAL. I LOVE MINIMAL AND BRUTALIST DESIGN. I LOVE NATURE, PIZZA AND ART.',
                  style: MyStyles.headlineTextStyle,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
