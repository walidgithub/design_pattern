import 'package:design_pattern/design_pattern/behavioral/strategy/order.dart';

import '../i_shipping_costs_stragtegy.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String? label = 'Priority shipping';

  @override
  double calculate(Order order) {
    return 9.99;
  }
}