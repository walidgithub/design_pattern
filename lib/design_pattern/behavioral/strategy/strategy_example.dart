import 'package:design_pattern/design_pattern/behavioral/strategy/order.dart';
import 'package:design_pattern/design_pattern/behavioral/strategy/shipping_options.dart';
import 'package:flutter/material.dart';

import 'I_shipping_costs_strategy/in_store_pickup_strategy.dart';
import 'I_shipping_costs_strategy/parcel_terminal_shipping_strategy.dart';
import 'I_shipping_costs_strategy/piriority_shipping_strategy.dart';
import 'i_shipping_costs_stragtegy.dart';
import 'order_item.dart';
import 'order_summary.dart';

class StrategyExample extends StatefulWidget {
  @override
  _StrategyExampleState createState() => _StrategyExampleState();
}

class _StrategyExampleState extends State<StrategyExample> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
  ];

  int _selectedStrategyIndex = 0;
  Order _order = Order();

  void _addToOrder() {
    setState(() {
      _order.addOrderItem(OrderItem.random());
    });
  }

  void _clearOrder() {
    setState(() {
      _order = Order();
    });
  }

  void _setSelectedStrategyIndex(int index) {
    setState(() {
      _selectedStrategyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OrderButtons(
              onAdd: _addToOrder,
              onClear: _clearOrder,
            ),
            const SizedBox(height: LayoutConstants.spaceM),
            Stack(
              children: <Widget>[
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _order.items.isEmpty ? 1.0 : 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Your order is empty',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _order.items.isEmpty ? 0.0 : 1.0,
                  child: Column(
                    children: <Widget>[
                      OrderItemsTable(
                        orderItems: _order.items,
                      ),
                      const SizedBox(height: LayoutConstants.spaceM),
                      ShippingOptions(
                        selectedIndex: _selectedStrategyIndex,
                        shippingOptions: _shippingCostsStrategyList,
                        onChanged: _setSelectedStrategyIndex,
                      ),
                      OrderSummary(
                        shippingCostsStrategy:
                            _shippingCostsStrategyList[_selectedStrategyIndex],
                        order: _order,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
