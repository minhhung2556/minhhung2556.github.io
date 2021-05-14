import 'package:flutter/material.dart';

const _kAccentColor = Color(0x9080DEEA);

Widget buildFlatButton({Widget? child, Function()? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: child,
    style: ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      elevation: MaterialStateProperty.all<double>(0.0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor: MaterialStateProperty.all<Color>(_kAccentColor),
    ),
  );
}

Widget buildCircleButton({Widget? child, Function()? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: child,
    style: ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
          CircleBorder(side: BorderSide(color: Colors.transparent))),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      elevation: MaterialStateProperty.all<double>(0.0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor: MaterialStateProperty.all<Color>(_kAccentColor),
    ),
  );
}
