import 'package:design_pattern/design_pattern/structural/decorator/pizza.dart';
import 'package:design_pattern/design_pattern/structural/decorator/pizza_menu.dart';
import 'package:design_pattern/design_pattern/structural/decorator/pizza_topping_data.dart';
import 'package:flutter/material.dart';

class DecoratorExample extends StatefulWidget {
  @override
  _DecoratorExampleState createState() => _DecoratorExampleState();
}

class _DecoratorExampleState extends State<DecoratorExample> {
  final PizzaMenu pizzaMenu = PizzaMenu();

  Map<int, PizzaToppingData>? _pizzaToppingsDataMap;
  Pizza? _pizza;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pizzaToppingsDataMap = pizzaMenu.getPizzaToppingsDataMap();
    _pizza = pizzaMenu.getPizza(0, _pizzaToppingsDataMap!);
  }

  void _onSelectedIndexChanged(int index) {
    _setSelectedIndex(index);
    _setSelectedPizza(index);
  }

  void _setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCustomPizzaChipSelected(int index, bool selected) {
    _setChipSelected(index, selected);
    _setSelectedPizza(_selectedIndex);
  }

  void _setChipSelected(int index, bool selected) {
    setState(() {
      _pizzaToppingsDataMap![index]!.setSelected(selected);
    });
  }

  void _setSelectedPizza(int index) {
    setState(() {
      _pizza = pizzaMenu.getPizza(index, _pizzaToppingsDataMap!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Select your pizza:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            PizzaSelection(
              selectedIndex: _selectedIndex,
              onChanged: _onSelectedIndexChanged,
            ),
            AnimatedContainer(
              height: _selectedIndex == 2 ? 100.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: CustomPizzaSelection(
                pizzaToppingsDataMap: _pizzaToppingsDataMap,
                onSelected: _onCustomPizzaChipSelected,
              ),
            ),
            PizzaInformation(
              pizza: _pizza,
            ),
          ],
        ),
      ),
    );
  }
}
