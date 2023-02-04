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

  final IDataApi _repository = DataRepository();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile?>(
      future: _repository.getLatestProfile(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildBody(context, snapshot.data!);
        } else {
          return MyWidgets.loadingIndicator;
        }
      },
    );
  }

  Widget buildBody(BuildContext context, Profile data) {
    return Material(
      color: MyColors.mainBackgroundColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Part1(scrollController: _scrollController, data: data),
            Part2(scrollController: _scrollController, data: data),
            Part3(scrollController: _scrollController, data: data),
            Part4(scrollController: _scrollController, data: data),
            /*
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
