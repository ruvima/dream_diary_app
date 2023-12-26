import '../../../../core/shared/domain/domain.dart';
import '../../domain/domain.dart';
import '../datasource/dream_datasource_impl.dart';

class DreamRepositoryImpl extends DreamRepository {
  DreamRepositoryImpl({
    required DreamDatasourceImpl datasource,
  }) : _datasource = datasource;

  final DreamDatasourceImpl _datasource;

  @override
  Stream<List<DreamEntity>> getDreams() {
    try {
      return _datasource.getDreams();
    } catch (e) {
      if (e is DatabaseException) {
        throw DatabaseFailure(e.message);
      } else {
        throw Exception('An unexpected error occurred');
      }
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _datasource.delete(id);
    } catch (e) {
      if (e is DatabaseException) {
        throw DatabaseFailure(e.message);
      } else {
        throw Exception('An unexpected error occurred');
      }
    }
  }
}
