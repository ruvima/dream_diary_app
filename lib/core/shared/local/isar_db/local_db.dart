import 'package:isar/isar.dart';

abstract class LocalDb<T> {
  Future<Isar> initDb(List<CollectionSchema<dynamic>> schemas);
  Future<Isar> getDb();
  Future<void> setDB(Future<Isar> isar);

  Future<void> delete(Future Function() action);

  Future<void> create(
    Future<dynamic> Function() action,
  );

  Future<void> update(
    Future<T> Function() action,
  );
}
