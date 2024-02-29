import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/domain.dart';
import 'local_db.dart';

class IsarDB extends LocalDb {
  IsarDB();
  late Future<Isar> _db;

  @override
  Future<Isar> initDb(List<CollectionSchema<dynamic>> schemas) async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        schemas,
        inspector: true,
        directory: dir.path,
      );
    } else {
      return await Future.value(Isar.getInstance());
    }
  }

  @override
  Future<Isar> getDb() async => _db;

  @override
  Future<void> setDB(Future<Isar> isar) => _db = isar;

  Future<T> _executeTransaction<T>(Future<T> Function() action) async {
    final isar = await getDb();
    try {
      return await isar.writeTxn(action);
    } on IsarError catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> delete(Future Function() action) async {
    await _executeTransaction(action);
  }

  @override
  Future<void> create(Future Function() action) async {
    return await _executeTransaction(action);
  }

  @override
  Future<void> update(Future Function() action) async {
    return await _executeTransaction(action);
  }
}
