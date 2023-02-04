import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minhhung2556/index.dart';
import 'package:minhhung2556/presentation/pages/home/keys.dart';

class HomePage extends StatefulWidget {
  static Widget newInstance() => BlocProvider(
        create: (context) => HomeBloc()..add(HomeEventInitial()),
        child: HomePage(),
      );

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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeDoneLoadingState) {
          return buildBody(context, state.data);
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
            Part3(key: kPart3Key, scrollController: _scrollController, data: data),
            Part4(key: kPart4Key, scrollController: _scrollController, data: data),
          ],
        ),
      ),
    );
  }
}
