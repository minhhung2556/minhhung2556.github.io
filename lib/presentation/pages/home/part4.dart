import 'package:flutter/material.dart';

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
    return Padding(
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
                                    //TODO
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
    );
  }
}
