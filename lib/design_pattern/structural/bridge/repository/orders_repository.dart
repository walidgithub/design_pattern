import 'package:design_pattern/design_pattern/structural/bridge/repository/i_repository.dart';


import '../entities/entity_base.dart';
import '../entities/order.dart';
import '../storage/i_storage.dart';

class OrdersRepository implements IRepository {
  final IStorage storage;

  const OrdersRepository(this.storage);

  @override
  List<EntityBase> getAll() {
    return storage.fetchAll<Order>();
  }

  @override
  void save(EntityBase entityBase) {
    storage.store<Order>(entityBase);
  }
}