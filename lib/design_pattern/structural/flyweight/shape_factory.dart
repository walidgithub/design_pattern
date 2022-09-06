import 'package:design_pattern/design_pattern/structural/flyweight/positioned_shape.dart';
import 'package:design_pattern/design_pattern/structural/flyweight/shape_type.dart';
import 'package:design_pattern/design_pattern/structural/flyweight/square.dart';
import 'package:design_pattern/design_pattern/structural/flyweight/circle.dart';
import 'package:flutter/material.dart';

//CHOOSE SHAPE
class ShapeFactory {
  IPositionedShape createShape(ShapeType shapeType) {
    switch (shapeType) {
      case ShapeType.Circle:
        return Circle(
          color: const Color.fromARGB(20, 10, 10, 0),
          diameter: 10.0,
        );
      case ShapeType.Square:
        return Square(
          color: const Color.fromARGB(20, 50, 70, 0),
          width: 10.0,
        );
      default:
        throw Exception("Shape type '$shapeType' is not supported.");
    }
  }
}