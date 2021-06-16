import 'package:flutter/material.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/v1/common/res.dart' as v1Common;
import 'package:minhhung2556/v1/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kMyName,
      theme: ThemeData(
        primarySwatch: v1Common.kAccentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageV1(),
    );
  }
}
