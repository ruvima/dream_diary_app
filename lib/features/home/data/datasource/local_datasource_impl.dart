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
  Stream<List<DreamEntity>> getDreams(String? searchTerm) async* {
    try {
      final isar = await _db.getDb();

      yield* isar.dreamEntitys
          .where()
          .optional(
            searchTerm != null && searchTerm.isNotEmpty,
            (q) => q
                .filter()
                .titleContains(
                  searchTerm!,
                  caseSensitive: false,
                )
                .or()
                .descriptionContains(
                  searchTerm,
                  caseSensitive: false,
                ),
          )
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

  @override
  Stream<List<DreamEntity>> getFilteredDreams(FilterRequestModel param) async* {
    final now = DateTime.now();
    final days = calculateDays(param.timeRange);
    try {
      final isar = await _db.getDb();

      yield* isar.dreamEntitys
          .where()
          .optional(
            days != 0,
            (q) => q.filter().dateBetween(
                  now.subtract(
                    Duration(days: days),
                  ),
                  now,
                ),
          )
          .sortByDateDesc()
          .watch(fireImmediately: true);
    } on IsarError catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}

int calculateDays(TimeRange? timeRange) {
  return timeRange != null
      ? timeRange == TimeRange.thirtyDays
          ? 30
          : timeRange == TimeRange.oneYear
              ? 360
              : 0
      : 0;
}
