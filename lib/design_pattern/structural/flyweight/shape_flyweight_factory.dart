import 'package:design_pattern/design_pattern/structural/flyweight/positioned_shape.dart';
import 'package:design_pattern/design_pattern/structural/flyweight/shape_factory.dart';
import 'package:design_pattern/design_pattern/structural/flyweight/shape_type.dart';

//create object from shape if not found
class ShapeFlyweightFactory {
  final ShapeFactory? shapeFactory;
  final Map<ShapeType, IPositionedShape> shapesMap = Map<ShapeType, IPositionedShape>();

  ShapeFlyweightFactory({
    this.shapeFactory,
  }) : assert(shapeFactory != null);

  IPositionedShape getShape(ShapeType shapeType) {
    if (!shapesMap.containsKey(shapeType)) {
      shapesMap[shapeType] = shapeFactory!.createShape(shapeType);
    }

    return shapesMap[shapeType]!;
  }

  int getShapeInstancesCount() {
    return shapesMap.length;
  }
}