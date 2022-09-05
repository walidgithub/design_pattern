import 'package:design_pattern/design_pattern/creational/prototype/shape.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Rectangle extends Shape {
  late double height;
  late double width;

  Rectangle(Color color, this.height, this.width):super(color);

  Rectangle.initial([Color color = Colors.black]):super(color) {
    height = 100.0;
    width = 100.0;
  }

  Rectangle.clone(Rectangle source) : super.clone(source) {
    height = source.height;
    width = source.width;
  }

  @override
  Shape clone() {
    return Rectangle.clone(this);
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
    height = random.nextInt(100, min: 50).toDouble();
    width = random.nextInt(100, min: 50).toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120.0,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
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