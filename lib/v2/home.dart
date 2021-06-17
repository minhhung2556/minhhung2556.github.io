import 'package:flutter/material.dart';
import 'package:minhhung2556/v2/res.dart';

class HomePageV2 extends StatefulWidget {
  @override
  _HomePageV2State createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Design.colorPrimaryDark,
          ),
        ),
        Expanded(
          child: Container(
            color: Design.colorPrimaryAccentDark,
          ),
        ),
        Expanded(
          child: Container(
            color: Design.colorPrimaryLight,
          ),
        ),
        Expanded(
          child: Container(
            color: Design.colorPrimaryAccentLight,
          ),
        ),
      ],
    );
  }
}
