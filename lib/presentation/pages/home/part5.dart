import 'package:flutter/material.dart';

import '../../../index.dart';

class Part5 extends StatefulWidget {
  final ScrollController scrollController;
  const Part5({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<Part5> createState() => _Part5State();
}

class _Part5State extends State<Part5> {
  double ratingStars = 5;
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
          Text(
            'MY ROMANTIC PROJECTS',
            style: MyStyles.heading1TextStyle,
          ),
        ],
      ),
    );
  }
}
