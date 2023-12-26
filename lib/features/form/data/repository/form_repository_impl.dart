import '../../../../core/shared/domain/domain.dart';
import '../../domain/datasource/form_datasource.dart';
import '../../domain/repositories/form_repository.dart';

class FormRepositoryImpl extends FormRepository {
  FormRepositoryImpl({
    required FormDatasource formDatasource,
  }) : _datasource = formDatasource;

  final FormDatasource _datasource;

  @override
  Future<void> create(DreamEntity dream) async {
    try {
      await _datasource.create(dream);
    } catch (e) {
      if (e is DatabaseException) {
        throw DatabaseFailure(e.message);
      } else {
        throw Exception('An unexpected error occurred');
      }
    }
  }

  @override
  Future<void> update(DreamEntity dream) {
    try {
      return _datasource.update(dream);
    } catch (e) {
      if (e is DatabaseException) {
        throw DatabaseFailure(e.message);
      } else {
        throw Exception('An unexpected error occurred');
      }
    }
  }
}
