import 'package:design_pattern/design_pattern/structural/decorator/decorators/pizza_decorator.dart';

import '../pizza.dart';

class Sauce extends PizzaDecorator {
  Sauce(Pizza pizza) : super(pizza) {
    description = 'Sauce';
  }

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n- $description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.3;
  }
}