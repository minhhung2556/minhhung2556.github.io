import 'package:animated_text/animated_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fractal/flutter_fractal.dart';
import 'package:minhhung2556/design.dart';
import 'package:minhhung2556/generated/assets.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map<String, dynamic>?> getProfile() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference profiles = firestore.collection('profiles');
      final p = await profiles.doc('v1').get();
      final map = p.data() as Map<String, dynamic>;
      print('_HomePageState.getProfile.map: $map');
      return map;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Design.colorPrimaryDark,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SlinkyLoadingIndicator(),
              SizedBox(
                width: 200,
                height: 200,
                child: AnimatedText(
                  alignment: Alignment.center,
                  speed: Duration(milliseconds: 1000),
                  controller: AnimatedTextController.loop,
                  displayTime: Duration(milliseconds: 1000),
                  wordList: ['HI', 'I am', 'Romantic Developer'],
                  textStyle: TextStyle(color: Colors.white),
                  onAnimate: (index) {
                    print("Animating index:" + index.toString());
                  },
                  onFinished: () {
                    print("Animtion finished");
                  },
                ),
              ),
              FutureBuilder<Map<String, dynamic>?>(
                future: getProfile(),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data?['firstName'] ?? '',
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
              SizedBox(
                height: 900,
                child: ModelViewer(
                  src: Assets.assetHungldm1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
