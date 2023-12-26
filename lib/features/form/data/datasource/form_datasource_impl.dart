import 'package:isar/isar.dart';

import '../../../../core/shared/domain/domain.dart';
import '../../../../core/shared/local/isar_db/local_db.dart';
import '../../domain/datasource/form_datasource.dart';

class FormDatasourceImpl extends FormDatasource {
  FormDatasourceImpl({required LocalDb localDb}) : _db = localDb;

  final LocalDb _db;

  @override
  Future<void> create(DreamEntity dream) async {
    final isar = await _db.getDb();
    try {
      await isar.writeTxn(() async {
        await isar.dreamEntitys.put(dream);
      });
    } on IsarError catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> update(DreamEntity dream) async {
    final isar = await _db.getDb();
    try {
      await isar.writeTxn(() async {
        await isar.dreamEntitys.put(dream);
      });
    } on IsarError catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
