import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../../index.dart';

class Part2 extends StatefulWidget {
  final ScrollController scrollController;
  const Part2({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<Part2> createState() => _Part2State();
}

class _Part2State extends State<Part2> {
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
    final parentScrollOffset = widget.scrollController.offset;
    final modelW = screenSize.width / 3;
    final modelH = modelW;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello there!',
                  style: MyStyles.heading2TextStyle,
                ),
                SizedBox(
                  width: modelW,
                  height: modelH,
                  child: ModelViewer(
                    src: Assets.assetHungldm1,
                    autoPlay: true,
                    autoRotate: true,
                    rotationPerSecond: '120deg',
                    cameraControls: false,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: modelW,
              child: Text(
                '''I'm romantic developer, mobile team leader, motivational mentor, friendly daddy, truthful partner.

I use my passion and skills to create mobile application and experiences. National and international partners rely on me for mobile application, implementation, and management of their digital products. as an independent, i work also with web agencies, companies, startups and individuals to create a blueprint for the digital business. advisor and partner of some digital and fintech startups. also, judge at cssda and the webby.''',
                style: MyStyles.headlineTextStyle,
              ),
            ),
          ],
        ),
        SizedBox(height: screenSize.height * 0.25),
      ],
    );
  }
}
