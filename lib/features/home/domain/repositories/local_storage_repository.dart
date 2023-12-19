import '../../../../core/shared/domain/domain.dart';

abstract class LocalStorageRepository {
  Future<List<DreamEntity>> getDreams();

  Future<bool> create(DreamEntity dream);

  Future<bool> update(DreamEntity dream);

  Future<bool> delete(int id);
}
