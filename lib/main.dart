import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "This is me",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 150,
              backgroundImage: Image.network(
                "https://scontent.fsgn2-2.fna.fbcdn.net/v/t1.0-9/68493367_2471086616267942_1237442273399013376_n.jpg?_nc_cat=102&_nc_sid=85a577&_nc_ohc=R-XV5dAf5ZgAX-PmvaF&_nc_ht=scontent.fsgn2-2.fna&oh=8976026488ea267381a4911d5146b186&oe=5EE1E507",
              ).image,
            ),
          ],
        ),
      ),
    );
  }
}
