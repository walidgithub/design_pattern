
import 'package:design_pattern/design_pattern/behavioral/strategy/order.dart';

import '../i_shipping_costs_stragtegy.dart';

class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String? label = 'In-store pickup';

  @override
  double calculate(Order order) {
    return 0.0;
  }
}