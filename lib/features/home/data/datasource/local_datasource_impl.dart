import 'package:isar/isar.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../../domain/entities/dream_entity.dart';

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
