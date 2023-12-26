import '../../../../core/shared/domain/domain.dart';

abstract class LocalStorageDatasource {
  Stream<List<DreamEntity>> getDreams();

  Future<void> delete(int id);
}
