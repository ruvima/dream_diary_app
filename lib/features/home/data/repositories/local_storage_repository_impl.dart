import '../../domain/domain.dart';
import '../datasource/isar_datasource.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  LocalStorageRepositoryImpl({
    LocalStorageDatasource? datasource,
  }) : _datasource = datasource ?? IsarDatasource();

  final LocalStorageDatasource _datasource;

  @override
  Future<List<DreamEntity>> getDreams() {
    return _datasource.getDreams();
  }

  @override
  Future<bool> create(DreamEntity dream) {
    return _datasource.create(dream);
  }

  @override
  Future<bool> delete(int id) {
    return _datasource.delete(id);
  }

  @override
  Future<bool> update(DreamEntity dream) {
    return _datasource.update(dream);
  }
}
