import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
