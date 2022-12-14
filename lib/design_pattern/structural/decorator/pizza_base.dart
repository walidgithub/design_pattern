import 'package:design_pattern/design_pattern/structural/decorator/pizza.dart';

class PizzaBase extends Pizza {
  PizzaBase(String description) {
    this.description = description;
  }

  @override
  String getDescription() {
    return description!;
  }

  @override
  double getPrice() {
    return 3.0;
  }
}