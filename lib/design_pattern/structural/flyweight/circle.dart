import 'dart:ui';

import 'package:design_pattern/design_pattern/structural/flyweight/positioned_shape.dart';
import 'package:flutter/material.dart';

class Circle implements IPositionedShape {
  final Color? color;
  final double? diameter;

  Circle({
    this.color,
    this.diameter,
  })  : assert(color != null),
        assert(diameter != null);

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}