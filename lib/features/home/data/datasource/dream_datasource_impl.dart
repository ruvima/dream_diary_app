import 'package:isar/isar.dart';

import '../../../../core/shared/domain/domain.dart';
import '../../../../core/shared/local/isar_db/local_db.dart';
import '../../domain/datasource/dream_datasource.dart';

class DreamDatasourceImpl extends LocalStorageDatasource {
  DreamDatasourceImpl({required LocalDb localDb}) : _db = localDb;

  final LocalDb _db;

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
  Future<void> delete(int id) async {
    final isar = await _db.getDb();
    final deleted = await isar.writeTxn(() async {
      return await isar.dreamEntitys.delete(id);
    });
    if (deleted == false) {
      throw DatabaseException('Failed to delete dream entity');
    }
  }
}
