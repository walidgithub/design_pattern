import 'dart:math';

import 'package:design_pattern/design_pattern/creational/prototype/shape.dart';
import 'package:flutter/material.dart';

class Circle extends Shape {
  late double radius;

  Circle(Color color, this.radius):super(color);

  Circle.initial([Color color = Colors.black]):super(color) {
    radius = 50.0;
  }

Circle.clone(Circle source) : super.clone(source) {
  radius = source.radius;
}

@override
Shape clone() {
  return Circle.clone(this);
}

@override
void randomiseProperties() {
  Random random = new Random();
  color = Color.fromRGBO(
    random.nextInt(255),
    random.nextInt(255),
    random.nextInt(255),
    1.0,
  );
  radius = random.nextInt(50, min: 25).toDouble();
}

@override
Widget render() {
  return SizedBox(
    height: 120.0,
    child: Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 2 * radius,
        width: 2 * radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.star,
          color: Colors.white,
        ),
      ),
    ),
  );
}
}