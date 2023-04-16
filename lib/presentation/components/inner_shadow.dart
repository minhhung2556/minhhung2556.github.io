import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key? key,
    this.shadowBlur: 6,
    this.shadowColor: Colors.black,
    this.shadowOffset: const Offset(6, 6),
    required Widget child,
  }) : super(key: key, child: child);

  final double shadowBlur;
  final Color shadowColor;
  final Offset shadowOffset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(BuildContext context, _RenderInnerShadow renderObject) {
    renderObject
      ..shadowColor = shadowColor
      ..shadowBlur = shadowBlur
      ..shadowOffset = shadowOffset;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  double? shadowBlur;
  Color? shadowColor;
  Offset? shadowOffset;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null || shadowBlur == null || shadowColor == null || shadowOffset == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - shadowOffset!.dx,
      size.height - shadowOffset!.dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: shadowBlur!, sigmaY: shadowBlur!)
      ..colorFilter = ColorFilter.mode(shadowColor!, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(shadowOffset!.dx, shadowOffset!.dy);
    context.paintChild(child!, offset);
    context.canvas
      ..restore()
      ..restore()
      ..restore();
  }
}
