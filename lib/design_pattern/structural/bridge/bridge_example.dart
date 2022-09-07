import 'package:design_pattern/design_pattern/structural/bridge/repository/orders_repository.dart';
import 'package:design_pattern/design_pattern/structural/bridge/storage/file_storage.dart';
import 'package:design_pattern/design_pattern/structural/bridge/storage/i_storage.dart';
import 'package:design_pattern/design_pattern/structural/bridge/storage/sql_storage.dart';
import 'package:flutter/material.dart';

import '../proxy/customer.dart';
import 'repository/customer_repository.dart';
import 'file_storage.dart';
import 'repository/i_repository.dart';
import 'i_storage.dart';
import 'entities/order.dart';

class BridgeExample extends StatefulWidget {
  @override
  _BridgeExampleState createState() => _BridgeExampleState();
}

class _BridgeExampleState extends State<BridgeExample> {
  final List<IStorage> _storages = [SqlStorage(), FileStorage()];

  IRepository? _customersRepository;
  IRepository? _ordersRepository;

  List<Customer>? _customers;
  List<Order>? _orders;

  int _selectedCustomerStorageIndex = 0;
  int _selectedOrderStorageIndex = 0;

  void _onSelectedCustomerStorageIndexChanged(int index) {
    setState(() {
      _selectedCustomerStorageIndex = index;
      _customersRepository = CustomersRepository(_storages[index]);
      _customers = _customersRepository.getAll();
    });
  }

  void _onSelectedOrderStorageIndexChanged(int index) {
    setState(() {
      _selectedOrderStorageIndex = index;
      _ordersRepository = OrdersRepository(_storages[index]);
      _orders = _ordersRepository.getAll();
    });
  }

  void _addCustomer() {
    _customersRepository!.save(Customer());
    setState(() {
      _customers = _customersRepository.getAll();
    });
  }

  void _addOrder() {
    _ordersRepository.save(Order());

    setState(() {
      _orders = _ordersRepository.getAll();
    });
  }

  @override
  void initState() {
    super.initState();

    _customersRepository =
        CustomersRepository(_storages[_selectedCustomerStorageIndex]);
    _customers = _customersRepository.getAll();

    _ordersRepository = OrdersRepository(_storages[_selectedOrderStorageIndex]);
    _orders = _ordersRepository.getAll();
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
            Row(
              children: <Widget>[
                Text(
                  'Select customers storage:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            StorageSelection(
              storages: _storages,
              selectedIndex: _selectedCustomerStorageIndex,
              onChanged: _onSelectedCustomerStorageIndexChanged,
            ),
            PlatformButton(
              child: Text('Add'),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _addCustomer,
            ),
            _customers.isNotEmpty
                ? CustomersDatatable(customers: _customers)
                : Text(
                    '0 customers found',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
            Divider(),
            Row(
              children: <Widget>[
                Text(
                  'Select orders storage:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            StorageSelection(
              storages: _storages,
              selectedIndex: _selectedOrderStorageIndex,
              onChanged: _onSelectedOrderStorageIndexChanged,
            ),
            PlatformButton(
              child: Text('Add'),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _addOrder,
            ),
            _orders.isNotEmpty
                ? OrdersDatatable(orders: _orders)
                : Text(
                    '0 orders found',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
          ],
        ),
      ),
    );
  }
}
