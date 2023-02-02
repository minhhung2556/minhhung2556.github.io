import 'package:flutter/material.dart';

import '../../../index.dart';

class Part1 extends StatelessWidget {
  const Part1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Stack(
          children: [
            Image.asset(
              Assets.assetHomepageCover,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color: Styles.mainBackgroundBlurColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Luong Do Minh Hung', style: Styles.nameTextStyle),
                      const Expanded(child: const SizedBox()),
                      TextButton(
                        child: Text(
                          'works',
                          style: Styles.menuButtonTextStyle,
                        ),
                        style: Styles.menuButtonStyle,
                        onPressed: () {
                          //TODO
                        },
                      ),
                      Text(',', style: Styles.menuButtonTextStyle),
                      TextButton(
                        child: Text(
                          'about',
                          style: Styles.menuButtonTextStyle,
                        ),
                        style: Styles.menuButtonStyle,
                        onPressed: () {
                          //TODO
                        },
                      ),
                      Text(',', style: Styles.menuButtonTextStyle),
                      TextButton(
                        child: Text(
                          'contact',
                          style: Styles.menuButtonTextStyle,
                        ),
                        style: Styles.menuButtonStyle,
                        onPressed: () {
                          //TODO
                        },
                      ),
                    ],
                  ),
                  const Divider(height: 1, thickness: 0.5, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Transform.translate(
            offset: Offset(0, 36 * (2.5 + 1.5)),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.translate(
                          offset: Offset(0, -36 * 3.5),
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'I am',
                              style: TextStyle(
                                color: Styles.accentColor,
                                fontFamily: Fonts.fontFamilyBebasNeueRegular,
                                fontSize: 36,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, 36 * 0.5),
                          child: Transform.scale(
                            scaleY: 2.5,
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              kName.replaceAll(' ', '\n').toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: Fonts.fontFamilyAbrilFatfaceRegular,
                                height: 0.8,
                                fontSize: 36 * 1.5,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const WidgetSpan(child: const SizedBox(width: 24)),
                  TextSpan(
                    text:
                        'BASED IN ITALY. I HAVE MANY YEARS OF EXPERIENCE IN CONSULTING IN ALL AREAS OF DIGITAL. I LOVE MINIMAL AND BRUTALIST DESIGN. I LOVE NATURE, PIZZA AND ART.',
                    style: TextStyle(color: Colors.white, fontFamily: Fonts.fontFamilyBebasNeueRegular, fontSize: 36),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
