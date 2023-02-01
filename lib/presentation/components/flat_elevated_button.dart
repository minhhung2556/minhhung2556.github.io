import 'package:flutter/material.dart';

const _kAccentColor = Color(0x9080DEEA);

Widget buildFlatButton({
  Widget? child,
  Function()? onPressed,
  Color? accentColor,
}) {
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
      overlayColor:
          MaterialStateProperty.all<Color>(accentColor ?? _kAccentColor),
      minimumSize: MaterialStateProperty.all<Size>(Size.zero),
    ),
  );
}

Widget buildCircleButton({
  Widget? child,
  Function()? onPressed,
  Color? accentColor,
}) {
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
      overlayColor:
          MaterialStateProperty.all<Color>(accentColor ?? _kAccentColor),
      minimumSize: MaterialStateProperty.all<Size>(Size.zero),
    ),
  );
}
