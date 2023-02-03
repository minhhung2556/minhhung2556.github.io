import 'package:flutter/material.dart';

import '../../../index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.mainBackgroundColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Part1(scrollController: _scrollController),
            /*Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ModelViewer(
                    src: Assets.assetHungldm1,
                    autoPlay: true,
                    autoRotate: true,
                    rotationPerSecond: '60deg',
                    cameraControls: false,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 1 / 3,
                    top: 120,
                  ),
                  child: Text(
                    '''I USE MY PASSION AND SKILLS TO CREATE DIGITAL PRODUCTS AND EXPERIENCES. NATIONAL AND INTERNATIONAL CUSTOMERS RELY ON ME FOR DESIGN, IMPLEMENTATION, AND MANAGEMENT OF THEIR DIGITAL PRODUCTS. AS AN INDEPENDENT, I WORK ALSO WITH WEB AGENCIES, COMPANIES, STARTUPS AND INDIVIDUALS TO CREATE A BLUEPRINT FOR THE DIGITAL BUSINESS. ADVISOR AND PARTNER OF SOME DIGITAL AND FINTECH STARTUPS. ALSO, JUDGE AT CSSDA AND THE WEBBY.''',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // showcases
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MY WORK EXPERIENCES',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FittedBox(
                            child: Text(
                              'HOME CREDIT VN - EMBEDDED IT VN',
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'MOBILE CHAPTER LEAD',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        Assets.assetWorkHomecredit,
                        height: MediaQuery.of(context).size.height / 3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
