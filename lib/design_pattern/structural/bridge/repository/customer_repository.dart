import 'package:design_pattern/design_pattern/structural/bridge/repository/i_repository.dart';


import '../../proxy/customer.dart';
import '../entities/entity_base.dart';
import '../storage/i_storage.dart';

class CustomersRepository implements IRepository {
  final IStorage storage;

  const CustomersRepository(this.storage);

  @override
  List<EntityBase> getAll() {
    return storage.fetchAll<Customer>();
  }

  @override
  void save(EntityBase entityBase) {
    storage.store<Customer>(entityBase);
  }
}