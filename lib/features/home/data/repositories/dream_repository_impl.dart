import '../../../../core/shared/domain/domain.dart';
import '../../domain/domain.dart';
import '../datasource/local_datasource_impl.dart';

class DreamRepositoryImpl implements IDreamsRepository {
  const DreamRepositoryImpl({
    required LocalDatasourceImpl datasource,
  }) : _datasource = datasource;

  final LocalDatasourceImpl _datasource;

  @override
  Future<void> create(DreamEntity dream) {
    return _datasource.create(dream);
  }

  @override
  Stream<List<DreamEntity>> getDreams() {
    return _datasource.getDreams();
  }

  @override
  Future<void> update(DreamEntity dream) {
    return _datasource.update(dream);
  }

  @override
  Future<void> delete(int id) async {
    await _datasource.delete(id);
  }
}
