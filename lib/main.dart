import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seo/seo.dart';

import 'index.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: kName,
        theme: kThemeData,
        home: HomePage.newInstance(),
      ),
    );
  }
}
