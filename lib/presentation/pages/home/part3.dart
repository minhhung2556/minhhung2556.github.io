import 'package:flutter/material.dart';

import '../../../index.dart';

class Part3 extends StatefulWidget {
  final ScrollController scrollController;
  const Part3({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<Part3> createState() => _Part3State();
}

class _Part3State extends State<Part3> {
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
            'MY WORKS',
            style: MyStyles.heading1TextStyle,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Chapter Lead'.toUpperCase(),
                      style: MyStyles.jobTitleTextStyle,
                    ),
                    Text(
                      'Home Credit Viet Nam'.toUpperCase(),
                      style: MyStyles.headlineTextStyle,
                    ),
                  ],
                ),
              ),
              Image.asset(Assets.assetWorkHomecredit),
            ],
          ),
          Row(
            children: [
              Image.asset(Assets.assetWorkSendo),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Mobile Tech Lead'.toUpperCase(),
                      style: MyStyles.jobTitleTextStyle,
                    ),
                    Text(
                      'Sendo.vn'.toUpperCase(),
                      style: MyStyles.headlineTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
