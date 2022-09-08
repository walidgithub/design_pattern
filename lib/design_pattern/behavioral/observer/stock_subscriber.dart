import 'dart:async';

import 'package:design_pattern/design_pattern/behavioral/observer/stock.dart';
import 'package:faker/faker.dart';

abstract class StockSubscriber {
  late final String title;

  final id = faker.guid.guid()!;


  final StreamController<Stock> stockStreamController =
  StreamController.broadcast();

  Stream<Stock> get stockStream => stockStreamController.stream;

  void update(Stock stock);
}