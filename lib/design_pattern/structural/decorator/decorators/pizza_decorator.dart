import 'package:design_pattern/design_pattern/structural/decorator/pizza.dart';

abstract class PizzaDecorator extends Pizza {
  final Pizza pizza;

  PizzaDecorator(this.pizza);

  @override
  String getDescription() {
    return pizza.getDescription();
  }

  @override
  double getPrice() {
    return pizza.getPrice();
  }
}