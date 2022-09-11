

import 'package:design_pattern/design_pattern/behavioral/strategy/order.dart';

abstract class IShippingCostsStrategy {
  String? label;
  double calculate(Order order);
}