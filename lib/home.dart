import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minhhung2556/common/flat_elevated_button.dart';
import 'package:minhhung2556/data.dart';
import 'package:minhhung2556/design.dart';
import 'package:minhhung2556/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Design.colorPrimaryDark,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: kIsWeb ? Design.topMenuBar : 0,
              ),
              Container(
                color: Design.colorPrimaryAccentDark,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Design.screenPadding,
                            horizontal: Design.screenPadding),
                        child: Column(
                          children: [
                            Text(
                              kInformationData['hi'],
                              style: Design.textStyleRegularLight,
                            ),
                            Text(
                              kInformationData['name'],
                              style: Design.textStyleTitleLight,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: Design.screenPadding),
                              child: Text(
                                kInformationData['title'],
                                style: Design.textStyleRegularLight,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 0.75,
                        child: Image.asset(
                          Assets.assetAvatar,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(Design.screenPadding),
                color: Design.colorPrimaryLight,
                child: Text(
                  kInformationData['summary'][0],
                  style: Design.textStyleTitleDark,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(Design.screenPadding),
                color: Design.colorPrimaryDark,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.wifi_tethering,
                      size: Design.iconSize,
                      color: Design.colorPrimaryAccentLight,
                    ),
                    Text(
                      kInformationData['summary'][1],
                      style: Design.textStyleRegularLight,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(Design.screenPadding),
                color: Design.colorPrimaryLight,
                child: Text(
                  kInformationData['summary'][2],
                  style: Design.textStyleTitleDark,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: Design.screenPadding),
                color: Design.colorPrimaryAccentDark,
                child: Column(
                  children: kInformationData['skills'].map<Widget>((data) {
                    var index = kInformationData['skills'].indexOf(data);
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: index < kInformationData['skills'].length - 1
                              ? Design.screenPadding
                              : 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Design.screenPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    data['i'] is String
                                        ? Image.asset(
                                            data['i'],
                                            width: Design.iconSize,
                                            height: Design.iconSize,
                                            color:
                                                Design.colorPrimaryAccentLight,
                                            colorBlendMode: BlendMode.srcATop,
                                          )
                                        : Icon(
                                            data['i'],
                                            color:
                                                Design.colorPrimaryAccentLight,
                                            size: Design.iconSize,
                                          ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Design.screenPadding),
                                        child: Text(
                                          data['t'],
                                          maxLines: 1,
                                          style: Design.textStyleTitleLight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: Design.screenPadding),
                                  child: Text(
                                    data['d'],
                                    style: Design.textStyleRegularLight,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Divider(
                              color: Design.colorPrimaryAccentLight,
                              thickness: 2,
                              height: 2,
                            ),
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                top: Design.screenPadding),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                color: Design.colorPrimaryDark,
                child: Column(
                  children: kInformationData['works'].map<Widget>((data) {
                    var index = kInformationData['works'].indexOf(data);
                    return Column(
                      children: [
                        if (index > 0)
                          Divider(
                            color: Design.colorPrimaryAccentLight,
                            thickness: 2,
                            height: 2,
                          ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                data['i'],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: Design.screenPadding),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['c'],
                                      maxLines: 1,
                                      style: Design.textStyleTitleLight,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: Design.itemPadding),
                                      child: Text(
                                        '${data['d']}',
                                        style: Design.textStyleRegularLight,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(
                                          Design.screenPadding),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: data['ls'].map<Widget>((e) {
                                          Widget c;
                                          var iconSize = Design.iconSize;
                                          var iconColor =
                                              Design.colorPrimaryAccentLight;
                                          switch (
                                              e['n'].toString().toLowerCase()) {
                                            case 'android':
                                              c = Icon(
                                                Icons.android_rounded,
                                                size: iconSize,
                                                color: iconColor,
                                              );
                                              break;
                                            case 'ios':
                                              c = Image.asset(
                                                Assets.assetLogoapple,
                                                width: iconSize,
                                                height: iconSize,
                                                color: iconColor,
                                              );
                                              break;
                                            case 'website':
                                            default:
                                              c = Icon(
                                                Icons.open_in_browser,
                                                size: iconSize,
                                                color: iconColor,
                                              );
                                              break;
                                          }
                                          return buildCircleButton(
                                            accentColor:
                                                Design.colorPrimaryAccentDark,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  Design.itemPadding),
                                              child: c,
                                            ),
                                            onPressed: () {
                                              launch(e['l'],
                                                  webOnlyWindowName: e['n']);
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Container(
                color: Design.colorPrimaryLight,
                padding: const EdgeInsets.only(top: Design.screenPadding),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                kInformationData['findMe'],
                                style: Design.textStyleTitleDark,
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: Design.itemPadding),
                                child: Icon(
                                  Icons.stacked_line_chart,
                                  size: Design.iconSize,
                                  color: Design.colorPrimaryAccentDark,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.all(Design.screenPadding),
                                color: Design.colorPrimaryLight,
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  // crossAxisAlignment:
                                  //     WrapCrossAlignment.center,
                                  // runAlignment: WrapAlignment.center,
                                  runSpacing: Design.screenPadding,
                                  spacing: Design.screenPadding,
                                  children: kInformationData['social']
                                      .map<Widget>((e) => buildCircleButton(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  Design.itemPadding),
                                              child: Image.asset(
                                                e['i'],
                                                width: Design.socialIconSize,
                                                height: Design.socialIconSize,
                                              ),
                                            ),
                                            onPressed: () {
                                              launch(e['l'],
                                                  webOnlyWindowName: e['n']);
                                            },
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 0.75,
                            child: Image.asset(
                              Assets.assetAvatar1,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Design.colorPrimaryDark,
                padding: const EdgeInsets.all(Design.screenPadding),
                child: Column(
                  children: [
                    Text(
                      kInformationData['copyright'][0] +
                          kInformationData['copyright'][1],
                      style: Design.textStyleRegularLight,
                    ),
                    Text(
                      kInformationData['copyright'][2],
                      style: Design.textStyleRegularLight,
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
}
