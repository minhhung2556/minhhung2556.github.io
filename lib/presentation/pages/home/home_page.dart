import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:minhhung2556/index.dart';
import 'package:url_launcher/url_launcher.dart';

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
  var _screenSize = Size.zero;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    Future.delayed(
      Duration(seconds: 2),
      () {
        if (_scrollController.hasClients) _scrollController.jumpTo(_screenSize.height * 10);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state is HomeDoneLoadingState ? buildBody(context, state.data) : const SizedBox();
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, Profile data) {
    _screenSize = MediaQuery.of(context).size;
    final screenW = _screenSize.width;
    final screenH = _screenSize.height;
    final theme = Theme.of(context);
    final offset = _scrollController.hasClients ? _scrollController.offset : 0.0;
    //
    final values = List.generate(
        30,
        (index) =>
            offset - screenH * index <= screenH ? max(0.0, min(1.0, (offset - screenH * index) / screenH)) : 1.0);
    int index = 0;
    //
    final bodyChildren = [
      Container(
        width: screenW,
        height: screenH,
        child: _page1(context, theme, offset, values[index++], _screenSize, screenW, screenH, data),
      ),
      Container(
        width: screenW,
        height: screenH,
        child: _page2(context, theme, offset, values[index++], _screenSize, screenW, screenH, data),
      ),
      Container(
        width: screenW,
        height: screenH,
        child: _page3(context, theme, offset, values[index++], _screenSize, screenW, screenH, data),
      ),
      Container(
        width: screenW,
        height: screenH,
        child: _page4(context, theme, offset, values[index++], _screenSize, screenW, screenH, data),
      ),
      ...data.works.map(
        (e) => Container(
          width: screenW,
          height: screenH,
          child: _page5(context, theme, offset, values[index++], _screenSize, screenW, screenH, data, e),
        ),
      ),
    ];
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenH * bodyChildren.length,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: bodyChildren,
                ),
              ),
              // expandable children
              _page6(context, theme, offset, values[index++], _screenSize, screenW, screenH, data),
              _page7(context, theme, offset, values[index++], _screenSize, screenW, screenH, data),
              _pageEnd(context, theme, offset, values[index++], _screenSize, screenW, screenH, data),
            ],
          ),
        ),
      ],
    );
  }

  Widget _page1(BuildContext context, ThemeData theme, double offset, double value, Size screenSize, double screenW,
      double screenH, Profile data) {
    final mainTitleStrings =
        '*${data.nickName}${DateFormat.y(kLocaleEn.toLanguageTag()).format(data.createdDate.toDate())}'.split(' ');
    final avatarW = min(screenW, screenH) * 0.5;
    final avatarH = 1.7 * avatarW;
    final avatarBorder = BorderRadius.horizontal(left: Radius.circular(avatarH));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: kScreenPadding,
          child: Row(
            children: [
              Text('Hi there!', style: theme.textTheme.headline5),
              const Expanded(child: SizedBox()),
              TextButton(
                onPressed: () {
                  _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                      duration: Duration(seconds: 1), curve: Curves.linear);
                },
                child: Text('BUZZ!!! me', style: theme.textTheme.headline5!.copyWith(color: theme.primaryColor)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: Offset(min(1, value * 5) * (screenW * 0.5 - avatarW * 0.5), 0),
                child: ClipRRect(
                  borderRadius: TweenSequence<BorderRadius>([
                    TweenSequenceItem(tween: Tween(begin: BorderRadius.zero, end: avatarBorder), weight: 0.2),
                    TweenSequenceItem(tween: ConstantTween(avatarBorder), weight: 0.8),
                  ]).transform(value),
                  child: Image.network(
                    data.avatarUrl,
                    fit: BoxFit.cover,
                    width: avatarW,
                    height: avatarH,
                  ),
                ),
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
                                scale: 1 + 20 * value,
                                child: Transform.translate(
                                    offset: Offset(0.0, -offset),
                                    child: Text(e, style: theme.textTheme.headline1, textAlign: TextAlign.center)),
                              );
                            } else {
                              return Transform.rotate(
                                // alignment: Alignment.topRight * (index % 2 == 0 ? -1.0 : 1.0),
                                alignment: Alignment.bottomLeft,
                                // angle: (index % 2 == 0 ? -1 : 1) * value * 90 * pi / 180.0,
                                angle: -value * 90 * pi / 180.0,
                                child: Transform.translate(
                                  // offset: Offset((index % 2 == 0 ? -1 : 1) * offset, 0.0),
                                  offset: Offset(-offset, 0.0),
                                  child: Opacity(
                                      opacity: 1 - value,
                                      child: Text(e, style: theme.textTheme.headline1, textAlign: TextAlign.center)),
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
              Transform.translate(
                offset: Offset(min(1, value * 5) * (screenW * 0.5 - avatarW * 0.5), 0),
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  onHover: (isHovered) {
                    setState(() {
                      _opacity = isHovered ? 1.0 : 0.0;
                    });
                  },
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 600),
                    opacity: _opacity,
                    child: Image.network(
                      data.overlayAvatar,
                      fit: BoxFit.cover,
                      width: avatarW,
                      height: avatarH,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _page2(BuildContext context, ThemeData theme, double offset, double value, Size screenSize, double screenW,
      double screenH, Profile data) {
    return Center(
      child: Transform.translate(
        offset: TweenSequence([
          TweenSequenceItem(tween: Tween(begin: Offset(0.0, -screenH * 0.3), end: Offset.zero), weight: 0.2),
          TweenSequenceItem(tween: Tween(begin: Offset.zero, end: Offset(0.0, screenH)), weight: 0.8),
        ]).transform(value),
        child: Transform.scale(
          scale: TweenSequence([
            TweenSequenceItem(tween: Tween(begin: 30.0, end: 1.0), weight: 0.3),
            TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.7),
          ]).transform(value),
          child: Opacity(
            opacity: 1 - value,
            child: Text(
              'Who am I?',
              style: theme.textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _page3(BuildContext context, ThemeData theme, double offset, double value, Size screenSize, double screenW,
      double screenH, Profile data) {
    return Transform.translate(
      offset: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: Offset(0.0, -screenH * 0.4), end: Offset.zero), weight: 0.3),
        TweenSequenceItem(tween: Tween(begin: Offset.zero, end: Offset(0.0, screenH)), weight: 0.7),
      ]).transform(value),
      child: Transform.scale(
        scale: TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 50.0, end: 1.0), weight: 0.3),
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.7),
        ]).transform(value),
        child: Opacity(
          opacity: TweenSequence([
            TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 0.3),
            TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 0.7),
          ]).transform(value),
          child: Container(
            padding: kScreenPadding,
            alignment: Alignment.center,
            child: Text(data.headline, style: theme.textTheme.headline3, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }

  Widget _page4(BuildContext context, ThemeData theme, double offset, double value, Size screenSize, double screenW,
      double screenH, Profile data) {
    return Transform.translate(
      offset: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: Offset(0.0, -screenH * 0.4), end: Offset.zero), weight: 0.3),
        TweenSequenceItem(tween: Tween(begin: Offset.zero, end: Offset(0.0, screenH)), weight: 0.7),
      ]).transform(value),
      child: Opacity(
        opacity: TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 0.1),
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.5),
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 0.4),
        ]).transform(value),
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...data.skillSummary.replaceAll('\\n', '\n').split('\n').map(
                    (e) => Text(e, style: theme.textTheme.headline6),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _page5(BuildContext context, ThemeData theme, double offset, double value, Size screenSize, double screenW,
      double screenH, Profile data, Works e) {
    final imageW = screenW / 3;
    final itemValue = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 0.2),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.6),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 0.2),
    ]).transform(value);
    final translateValue = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.4),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 0.1),
    ]).transform(value);

    return Transform.translate(
      // offset: Offset(0.0, screenH * translateValue * value),
      offset: Offset.zero,
      child: Opacity(
        // opacity: TweenSequence([
        //   TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 0.2),
        //   TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.6),
        //   TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 0.2),
        // ]).transform(value),
        opacity: 1,
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('My work experience'.toUpperCase(), style: theme.textTheme.bodyText1),
              Text(e.jobTitle, style: theme.textTheme.headline2),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => launchUrl(Uri.parse(e.companyWebsite)),
                    child: Text(e.companyName, style: theme.textTheme.headline3!.copyWith(color: theme.primaryColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kScreenPadding.left),
                    child: Text(
                        (e.startDate == null ? '' : DateFormat.yM().format(e.startDate!.toDate()) + ' - ') +
                            (e.endDate == null ? 'now' : DateFormat.yM().format(e.endDate!.toDate())),
                        style: theme.textTheme.headline3),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(child: SizedBox()),
                          Text(
                            e.description.replaceAll('\\n', '\n'),
                            style: theme.textTheme.headline6,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 6,
                          ),
                          TextButton(
                              onPressed: () => DetailWorkDialog.show(context, e),
                              child: Text(
                                'Read more...',
                                style: theme.textTheme.bodyText1!.copyWith(color: theme.primaryColor),
                              )),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                    IgnorePointer(
                      child: Padding(
                        padding: kScreenPadding * 2,
                        child: Transform(
                          transform: Matrix4.skew(Tween(begin: 0.0, end: -0.4).transform(itemValue),
                              Tween(begin: 0.0, end: -0.1).transform(itemValue))
                            ..scale(Tween(begin: 1.0, end: 0.8).transform(itemValue),
                                Tween(begin: 1.0, end: 0.8).transform(itemValue), 1)
                            ..translate(Tween(begin: 0, end: imageW * 0.5).transform(itemValue)),
                          child: ClipRRect(
                            child: InnerShadow(
                              shadowColor: Colors.white,
                              shadowBlur: 24,
                              child: Image.network(
                                e.images.first,
                                fit: BoxFit.contain,
                                width: imageW,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _page6(BuildContext context, ThemeData theme, double offset, double value, Size screenSize, double screenW,
      double screenH, Profile data) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My personal works'.toUpperCase(), style: theme.textTheme.bodyText1),
          SizedBox(height: kScreenPadding.vertical),
          ...data.personalWorks.map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(e.jobTitle, style: theme.textTheme.headline2),
                  TextButton(
                    onPressed: () => launchUrl(Uri.parse(e.companyWebsite)),
                    child: Text(e.companyName, style: theme.textTheme.headline3!.copyWith(color: theme.primaryColor)),
                  ),
                  Text(
                    e.description.replaceAll('\\n', '\n'),
                    style: theme.textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _page7(BuildContext context, ThemeData theme, double offset, double value, Size screenSize, double screenW,
      double screenH, Profile data) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: kScreenPadding.vertical),
          Text('Contact me'.toUpperCase(), style: theme.textTheme.bodyText1),
          SizedBox(height: kScreenPadding.vertical),
          TextButton(
            onPressed: () => launchUrl(Uri.parse('mailto:${data.contactInfo.email}')),
            child: Text('Email', style: theme.textTheme.headline1!.copyWith(color: theme.primaryColor)),
          ),
          TextButton(
            onPressed: () => launchUrl(Uri.parse('tel:${data.contactInfo.phoneNumber}')),
            child: Text('Phone', style: theme.textTheme.headline1!.copyWith(color: theme.primaryColor)),
          ),
          ...data.contactInfo.websites.map(
            (e) => TextButton(
              onPressed: () => launchUrl(Uri.parse(e.url)),
              child: Text(e.name, style: theme.textTheme.headline1!.copyWith(color: theme.primaryColor)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageEnd(BuildContext context, ThemeData theme, double offset, double value, Size screenSize, double screenW,
      double screenH, Profile data) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => _scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.linear),
            child: Text('Back to top'.toUpperCase(),
                style: theme.textTheme.headline3!.copyWith(color: theme.primaryColor)),
          ),
        ],
      ),
    );
  }
}
