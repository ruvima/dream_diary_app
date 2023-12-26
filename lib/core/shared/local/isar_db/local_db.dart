import 'package:isar/isar.dart';

abstract class LocalDb {
  Future<Isar> initDb();
  Future<Isar> getDb();
}
