import 'package:flutter/material.dart';

Widget _buildPage1() {
  var av = _page1Value * 3;
  var dx = av * _screenW / 2;
  return Transform.translate(
    offset: Offset(0, _page1Value * _screenH),
    child: Container(
      color: kColorTween12.transform(av),
      width: _screenW,
      height: _screenH,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: kScreenPadding),
          Expanded(
            child: Transform.translate(
              offset: Offset(-dx, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          shadows: [kBoxShadow],
                        ),
                        children: [
                          TextSpan(
                            text: "Hi!   I'm ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          TextSpan(
                            text: kMyName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    kMyTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          const SizedBox(width: kScreenPadding * 2),
          Expanded(
            child: Transform.translate(
              offset: Offset(dx, 0),
              child: ShadowWidget(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                  child: Opacity(
                    opacity: max(0.0, 1 - _page1Value * 2),
                    child: Image.asset(
                      Assets.assetAvatar,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: kScreenPadding),
        ],
      ),
    ),
  );
}
