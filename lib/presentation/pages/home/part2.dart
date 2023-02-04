import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../../index.dart';

class Part2 extends StatefulWidget {
  final ScrollController scrollController;
  final Profile data;

  const Part2({
    Key? key,
    required this.scrollController,
    required this.data,
  }) : super(key: key);

  @override
  State<Part2> createState() => _Part2State();
}

class _Part2State extends State<Part2> {
  final modelTween = TweenSequence([
    TweenSequenceItem(
        tween: FractionalOffsetTween(begin: FractionalOffset(1, 0), end: FractionalOffset(0, 0)), weight: 0.25),
    TweenSequenceItem(
        tween: FractionalOffsetTween(begin: FractionalOffset(0, 0), end: FractionalOffset(0, 0)), weight: 0.25),
    TweenSequenceItem(
        tween: FractionalOffsetTween(begin: FractionalOffset(0, 0), end: FractionalOffset(1, 0)), weight: 0.25),
    TweenSequenceItem(
        tween: FractionalOffsetTween(begin: FractionalOffset(1, 0), end: FractionalOffset(1, 0)), weight: 0.25),
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
    final parentScrollOffset = widget.scrollController.offset;
    final parentMaxScrollExtent = widget.scrollController.position.maxScrollExtent;
    final modelW = screenSize.width / 3;
    final modelH = modelW;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(
                  modelTween.transform(parentScrollOffset / parentMaxScrollExtent)!.dx * screenSize.width / 2 - modelW,
                  -screenSize.height - modelH / 2 + parentScrollOffset),
              child: SizedBox(
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
            ),
            SizedBox(
              width: modelW,
              child: Text(
                widget.data.headline!.replaceAll('\\n', '\n'),
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
