import 'package:flutter/material.dart';
import 'package:minhhung2556/common/res.dart';
import 'package:minhhung2556/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lương Đỗ Minh Hưng',
      theme: ThemeData(
        primarySwatch: kAccentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
