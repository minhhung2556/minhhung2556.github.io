import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/home.dart';

void main() {
  if (kIsWeb) {
    runApp(DevicePreview(
      isToolbarVisible: false,
      data: DevicePreviewData(
        settings: DevicePreviewSettingsData(
          backgroundTheme: DevicePreviewBackgroundThemeData.dark,
        ),
        isDarkMode: true,
      ),
      builder: (BuildContext context) => MyApp(),
    ));
  } else {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kInformationData['name'],
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
