import '../entities/entity_base.dart';
import 'i_storage.dart';


class SqlStorage implements IStorage {
  Map<Type, List<EntityBase>> sqlStorage = Map<Type, List<EntityBase>>();

  @override
  String getTitle() {
    return 'SQL Storage';
  }

  @override
  List<T> fetchAll<T extends EntityBase>() {
    return sqlStorage.containsKey(T) ? sqlStorage[T] : List<T>();
  }

  @override
  void store<T extends EntityBase>(T entityBase) {
    if (!sqlStorage.containsKey(T)) {
      sqlStorage[T] = List<T>();
    }

    sqlStorage[T].add(entityBase);
  }
}