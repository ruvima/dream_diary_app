import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/shared/domain/domain.dart';
import '../../domain/datasource/local_storage_datasource.dart';

class IsarDatasource extends LocalStorageDatasource {
  IsarDatasource() {
    _db = _openDb();
  }
  late Future<Isar> _db;

  Future<Isar> _openDb() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [DreamEntitySchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<List<DreamEntity>> getDreams() async {
    final isar = await _db;

    return isar.dreamEntitys.where().sortByDateDesc().findAll();
  }

  @override
  Future<bool> create(DreamEntity dream) async {
    try {
      final isar = await _db;

      await isar.writeTxn(() async {
        await isar.dreamEntitys.put(dream);
      });

      return true;
    } on IsarError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<bool> update(DreamEntity dream) async {
    try {
      final isar = await _db;

      await isar.writeTxn(() async {
        await isar.dreamEntitys.put(dream);
      });

      return true;
    } on IsarError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      final isar = await _db;
      final success = await isar.writeTxn(() async {
        return await isar.dreamEntitys.delete(id);
      });

      return success;
    } on IsarError catch (e) {
      throw Exception(e.message);
    }
  }
}
