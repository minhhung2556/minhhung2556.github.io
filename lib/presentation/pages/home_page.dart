import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff141414),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Luong Do Minh Hung',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: Fonts.fontFamilyNunitoRegular,
                  ),
                ),
                const SizedBox(width: 24),
                Text(
                  'Romantic Developer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: Fonts.fontFamilyNunitoRegular,
                  ),
                ),
                const Expanded(child: const SizedBox()),
                Text(
                  'works',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: Fonts.fontFamilyNunitoRegular,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'about',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: Fonts.fontFamilyNunitoRegular,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'contact',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: Fonts.fontFamilyNunitoRegular,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
            const SizedBox(height: 24),
            SizedBox(height: MediaQuery.of(context).size.height * 0.35),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'creative',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.grey,
                        fontFamily: Fonts.fontFamilyBebasNeueRegular,
                      ),
                    ),
                    Text(
                      kName.replaceAll(' ', '\n').toUpperCase(),
                      style: TextStyle(
                        fontSize: 128,
                        color: Colors.white,
                        letterSpacing: -8,
                        fontFamily: Fonts.fontFamilyLobsterRegular,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: const SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '''I AM A DEVELOPER AND UX/UI
DESIGNER BASED IN ITALY. I HAVE MANY
YEARS OF EXPERIENCE IN CONSULTING IN
ALL AREAS OF DIGITAL. I LOVE MINIMAL
AND BRUTALIST DESIGN. I LOVE NATURE,
PIZZA AND ART.''',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontFamily: Fonts.fontFamilyBebasNeueRegular,
                      ),
                    ),
                    Text(
                      'CONTACT ME',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontFamily: Fonts.fontFamilyBebasNeueRegular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.5),
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ModelViewer(
                    src: Assets.assetHungldm1,
                    autoPlay: true,
                    autoRotate: true,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          'HELLO. I AM HUNG',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontFamily: Fonts.fontFamilyBebasNeueRegular,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'LUONG DO MINH',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: Fonts.fontFamilyBebasNeueRegular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 1 / 3,
                    top: 120,
                  ),
                  child: Text(
                    '''I USE MY PASSION AND SKILLS TO CREATE DIGITAL PRODUCTS AND EXPERIENCES. NATIONAL AND INTERNATIONAL CUSTOMERS RELY ON ME FOR DESIGN, IMPLEMENTATION, AND MANAGEMENT OF THEIR DIGITAL PRODUCTS. AS AN INDEPENDENT, I WORK ALSO WITH WEB AGENCIES, COMPANIES, STARTUPS AND INDIVIDUALS TO CREATE A BLUEPRINT FOR THE DIGITAL BUSINESS. ADVISOR AND PARTNER OF SOME DIGITAL AND FINTECH STARTUPS. ALSO, JUDGE AT CSSDA AND THE WEBBY.''',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontFamily: Fonts.fontFamilyBebasNeueRegular,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
