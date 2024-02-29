import 'package:isar/isar.dart';

import '../../../../core/shared/domain/domain.dart';
import '../../../../core/shared/local/isar_db/local_db.dart';
import '../../domain/datasource/dreams_datasource.dart';

class LocalDatasourceImpl implements IDreamsDatasource {
  const LocalDatasourceImpl({
    required LocalDb localDb,
  }) : _db = localDb;

  final LocalDb _db;

  @override
  Future<void> create(DreamEntity dream) {
    return _db.create(
      () => _db.getDb().then(
            (isar) => isar.dreamEntitys.put(dream),
          ),
    );
  }

  @override
  Stream<List<DreamEntity>> getDreams() async* {
    try {
      final isar = await _db.getDb();

      yield* isar.dreamEntitys
          .where()
          .sortByDateDesc()
          .watch(fireImmediately: true);
    } on IsarError catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> update(DreamEntity dream) {
    return _db.update(
      () => _db.getDb().then(
            (isar) => isar.dreamEntitys.put(dream),
          ),
    );
  }

  @override
  Future<void> delete(int id) {
    return _db.delete(
      () => _db.getDb().then(
            (isar) => isar.dreamEntitys.delete(id),
          ),
    );
  }
}
