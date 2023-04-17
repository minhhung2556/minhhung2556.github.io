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

  double get minDimension => min(_screenSize.width, _screenSize.height);
  bool get isPortrait => _screenSize.width < _screenSize.height;

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
              Container(
                width: screenW,
                height: screenH,
                child: _page1(context, theme, offset, values[index++], data),
              ),
              Container(
                width: screenW,
                height: screenH,
                child: _page2(context, theme, offset, values[index++], data),
              ),
              Container(
                width: screenW,
                height: screenH,
                child: _page3(context, theme, offset, values[index++], data),
              ),
              SizedBox(width: screenW, height: screenH),
              _page4(context, theme, offset, values[index++], data),
              (() {
                index++;
                return SizedBox(width: screenW, height: screenH);
              }).call(),
              ...data.works.map(
                (e) => Container(
                  width: screenW,
                  height: screenH,
                  child: _page5(context, theme, offset, values[index++], data, e),
                ),
              ),
              _page6(context, theme, offset, values[index++], data),
              _page7(context, theme, offset, values[index++], data),
              _pageEnd(context, theme, offset, values[index++], data),
            ],
          ),
        ),
      ],
    );
  }

  Widget _page1(BuildContext context, ThemeData theme, double offset, double value, Profile data) {
    final mainTitleStrings = '*${data.nickName} ${DateFormat.y().format(data.createdDate.toDate())}'.split(' ');
    final avatarW = minDimension * 0.5;
    final avatarH = 1.7 * avatarW;
    final avatarBorder = BorderRadius.horizontal(left: Radius.circular(avatarH));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: kScreenPadding,
          child: Row(
            children: [
              SeoTextWrapper('Hi there!', style: theme.textTheme.headlineSmall),
              const Expanded(child: SizedBox()),
              TextButton(
                onPressed: () {
                  _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                      duration: Duration(seconds: 1), curve: Curves.linear);
                },
                child: SeoTextWrapper('BUZZ!!! me',
                    style: theme.textTheme.headlineSmall!.copyWith(color: theme.primaryColor)),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: kScreenPadding,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.translate(
                  offset: Offset(min(1, value * 5) * (_screenSize.width - avatarW) * 0.5, 0),
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
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: SeoTextWrapper(e,
                                            style: theme.textTheme.displayLarge, textAlign: TextAlign.center),
                                      )),
                                );
                              } else {
                                return Transform.rotate(
                                  alignment: Alignment.bottomLeft,
                                  angle: -value * 90 * pi / 180.0,
                                  child: Transform.translate(
                                    offset: Offset(-offset, 0.0),
                                    child: Opacity(
                                        opacity: 1 - value,
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: SeoTextWrapper(e,
                                              style: theme.textTheme.displayLarge, textAlign: TextAlign.center),
                                        )),
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
                  offset: Offset(min(1, value * 5) * (_screenSize.width * 0.5 - avatarW * 0.5), 0),
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
        ),
      ],
    );
  }

  Widget _page2(BuildContext context, ThemeData theme, double offset, double value, Profile data) {
    return Transform.translate(
      offset: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: Offset(0.0, _screenSize.height * 0.25), end: Offset.zero), weight: 0.2),
        TweenSequenceItem(tween: Tween(begin: Offset.zero, end: Offset(0.0, _screenSize.height)), weight: 0.8),
      ]).transform(value),
      child: Transform.scale(
        scale: TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 50.0, end: 1.0), weight: 0.3),
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.7),
        ]).transform(value),
        child: Opacity(
          opacity: TweenSequence([
            TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.7),
            TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 0.3),
          ]).transform(value),
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: SeoTextWrapper(
                'Who am I?',
                style: theme.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _page3(BuildContext context, ThemeData theme, double offset, double value, Profile data) {
    return Transform.translate(
      offset: TweenSequence([
        TweenSequenceItem(tween: Tween(begin: Offset(0.0, _screenSize.height * 0.25), end: Offset.zero), weight: 0.2),
        TweenSequenceItem(tween: Tween(begin: Offset.zero, end: Offset(0.0, _screenSize.height)), weight: 0.8),
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
            child: SeoTextWrapper(data.headline, style: theme.textTheme.displaySmall, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }

  Widget _page4(BuildContext context, ThemeData theme, double offset, double value, Profile data) {
    return Container(
      width: _screenSize.width,
      padding: kScreenPadding,
      child: SeoTextWrapper(
        data.skillSummary.replaceAll('\\n', '\n'),
        style: theme.textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _page5(BuildContext context, ThemeData theme, double offset, double value, Profile data, Works e) {
    final imageW = minDimension / 3;
    final itemValue = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 0.4),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 0.1),
    ]).transform(value);

    return Padding(
      padding: kScreenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeoTextWrapper('My work experience'.toUpperCase(), style: theme.textTheme.bodyLarge),
          SizedBox(
            width: _screenSize.width * 0.5,
            child: FittedBox(
              fit: BoxFit.fill,
              child: SeoTextWrapper(e.jobTitle, style: theme.textTheme.displayMedium),
            ),
          ),
          SizedBox(
            width: _screenSize.width * 0.5,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => launchUrl(Uri.parse(e.companyWebsite)),
                    child: SeoTextWrapper(e.companyName,
                        style: theme.textTheme.displaySmall!.copyWith(color: theme.primaryColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kScreenPadding.left),
                    child: SeoTextWrapper(
                        (e.startDate == null ? '' : DateFormat.yM().format(e.startDate!.toDate()) + ' - ') +
                            (e.endDate == null ? 'now' : DateFormat.yM().format(e.endDate!.toDate())),
                        style: theme.textTheme.displaySmall),
                  ),
                ],
              ),
            ),
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
                      SeoTextWrapper(
                        e.description.replaceAll('\\n', '\n'),
                        style: theme.textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                      TextButton(
                          onPressed: () => DetailWorkDialog.show(context, e),
                          child: SeoTextWrapper(
                            'Read more...',
                            style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColor),
                          )),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 0.5625,
                      child: IgnorePointer(
                        child: Transform(
                          transform: Matrix4.skew(Tween(begin: 0.0, end: -0.4).transform(itemValue),
                              Tween(begin: 0.0, end: -0.1).transform(itemValue))
                            ..scale(Tween(begin: 1.0, end: 0.8).transform(itemValue),
                                Tween(begin: 1.0, end: 0.8).transform(itemValue), 1)
                            ..translate(Tween(begin: 0, end: imageW * 0.5).transform(itemValue)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: InnerShadow(
                              shadowColor: Colors.white,
                              shadowBlur: 24,
                              child: Image.network(
                                e.images.first,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _page6(BuildContext context, ThemeData theme, double offset, double value, Profile data) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeoTextWrapper('My personal works'.toUpperCase(), style: theme.textTheme.bodyLarge),
          SizedBox(height: kScreenPadding.vertical),
          ...data.personalWorks.map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SeoTextWrapper(e.jobTitle, style: theme.textTheme.displayMedium),
                  TextButton(
                    onPressed: () => launchUrl(Uri.parse(e.companyWebsite)),
                    child: SeoTextWrapper(e.companyName,
                        style: theme.textTheme.displaySmall!.copyWith(color: theme.primaryColor)),
                  ),
                  SeoTextWrapper(
                    e.description.replaceAll('\\n', '\n'),
                    style: theme.textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _page7(BuildContext context, ThemeData theme, double offset, double value, Profile data) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: kScreenPadding.vertical),
          SeoTextWrapper('Contact me'.toUpperCase(), style: theme.textTheme.bodyLarge),
          SizedBox(height: kScreenPadding.vertical),
          ...data.contactInfo.websites.map(
            (e) => FittedBox(
              fit: BoxFit.fill,
              child: TextButton(
                onPressed: () => launchUrl(Uri.parse(e.url)),
                child: SeoTextWrapper(e.name, style: theme.textTheme.displayLarge!.copyWith(color: theme.primaryColor)),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: TextButton(
              onPressed: () => launchUrl(Uri.parse('mailto:${data.contactInfo.email}')),
              child: SeoTextWrapper('Email', style: theme.textTheme.displayLarge!.copyWith(color: theme.primaryColor)),
            ),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: TextButton(
              onPressed: () => launchUrl(Uri.parse('tel:${data.contactInfo.phoneNumber}')),
              child: SeoTextWrapper('Phone', style: theme.textTheme.displayLarge!.copyWith(color: theme.primaryColor)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageEnd(BuildContext context, ThemeData theme, double offset, double value, Profile data) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => _scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.linear),
            child: SeoTextWrapper('Back to top'.toUpperCase(),
                style: theme.textTheme.displaySmall!.copyWith(color: theme.primaryColor)),
          ),
        ],
      ),
    );
  }
}
