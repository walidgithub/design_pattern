import 'dart:ui';

import 'package:design_pattern/design_pattern/structural/flyweight/positioned_shape.dart';
import 'package:flutter/material.dart';

class Square implements IPositionedShape {
  final Color? color;
  final double? width;

  Square({
    this.color,
    this.width,
  })  : assert(color != null),
        assert(width != null);

  double get height => width!;

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}