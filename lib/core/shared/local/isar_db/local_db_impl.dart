import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/domain.dart';
import 'local_db.dart';

class InitDbImpl extends LocalDb {
  InitDbImpl() {
    db = initDb();
  }
  late Future<Isar> db;

  @override
  Future<Isar> initDb() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [DreamEntitySchema],
        inspector: true,
        directory: dir.path,
      );
    } else {
      return await Future.value(Isar.getInstance());
    }
  }

  @override
  Future<Isar> getDb() async {
    return db;
  }
}
