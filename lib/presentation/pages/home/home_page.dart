import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:minhhung2556/index.dart';

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
  var _opacity = 0.0;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: state is HomeDoneLoadingState ? buildBody(context, state.data) : const SizedBox(),
        );
      },
    );
  }

  Widget buildBody(BuildContext context, Profile data) {
    final screenSize = MediaQuery.of(context).size;
    final screenW = screenSize.width;
    final screenH = screenSize.height;
    final theme = Theme.of(context);
    final offset = _scrollController.hasClients ? _scrollController.offset : 0.0;
    final mainTitleStrings =
        '${data.nickName} *${DateFormat.y(kLocaleEn.toLanguageTag()).format(data.createdDate.toDate())}'.split(' ');
    //
    final value0 = min(1.0, offset / screenH);
    final value1 = offset - screenH <= screenH ? max(0.0, min(1.0, (offset - screenH) / screenH)) : 0.0;
    final value2 = offset - screenH * 2 <= screenH ? max(0.0, min(1.0, (offset - screenH * 2) / screenH)) : 0.0;
    //
    final bodyChildren = [
      Container(
        width: screenW,
        height: screenH,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
              child: Row(
                children: [
                  Text('Hi there!', style: theme.textTheme.headline5),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    child: Image.network(
                      data.avatarUrl,
                      fit: BoxFit.cover,
                    ),
                    width: min(screenW, screenH) * 0.5,
                    height: screenH * 0.75,
                  ),
                  Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...mainTitleStrings.map(
                              (e) {
                                final index = mainTitleStrings.indexOf(e);
                                if (index == 0) {
                                  return Transform.scale(
                                    alignment: Alignment.topCenter,
                                    scale: 1 + 20 * value0,
                                    child: Transform.translate(
                                        offset: Offset(0.0, -offset),
                                        child: Text(e, style: theme.textTheme.headline1, textAlign: TextAlign.center)),
                                  );
                                } else {
                                  return Transform.rotate(
                                    alignment: Alignment.topRight * (index % 2 == 0 ? -1.0 : 1.0),
                                    angle: (index % 2 == 0 ? -1 : 1) * value0 * 90 * pi / 180.0,
                                    child: Transform.translate(
                                      offset: Offset((index % 2 == 0 ? -1 : 1) * offset, 0.0),
                                      child: Opacity(
                                          opacity: 1 - value0,
                                          child:
                                              Text(e, style: theme.textTheme.headline1, textAlign: TextAlign.center)),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    onHover: (isHovered) {
                      setState(() {
                        _opacity = isHovered ? 1.0 : 0.0;
                      });
                    },
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: _opacity,
                      child: SizedBox(
                        child: Image.network(
                          data.overlayAvatar,
                          fit: BoxFit.cover,
                        ),
                        width: min(screenW, screenH) * 0.5,
                        height: screenH * 0.75,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        width: screenW,
        height: screenH,
        alignment: Alignment.center,
        child: Transform.translate(
          offset: TweenSequence([
            TweenSequenceItem(tween: Tween(begin: Offset(0.0, -screenH * 0.3), end: Offset.zero), weight: 0.2),
            TweenSequenceItem(tween: Tween(begin: Offset.zero, end: Offset(0.0, screenH)), weight: 0.8),
          ]).transform(value1),
          child: Transform.scale(
            scale: TweenSequence([
              TweenSequenceItem(tween: Tween(begin: 30.0, end: 1.0), weight: 0.3),
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.7),
            ]).transform(value1),
            child: Text(
              '*Who am I?',
              style: theme.textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      Container(
        width: screenW,
        height: screenH,
        alignment: Alignment.center,
        child: Container(
          height: max(0.5, 1 - value2 * 2) * screenH,
          color: Colors.white10,
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
          alignment: Alignment.center,
          child: Text(data.headline, style: theme.textTheme.headline3, textAlign: TextAlign.center),
        ),
      ),
      Container(
        width: screenW,
        height: screenH,
        padding: EdgeInsets.symmetric(horizontal: screenW / 10, vertical: screenH / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...data.skillSummary.replaceAll('\\n', '\n').split('\n').map(
                  (e) => Text(e, style: theme.textTheme.headline6),
                ),
          ],
        ),
      ),
    ];
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          child: SizedBox(
            height: screenH * bodyChildren.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: bodyChildren,
            ),
          ),
        ),
      ],
    );
  }
}
