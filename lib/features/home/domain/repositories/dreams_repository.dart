import '../../../../core/shared/domain/domain.dart';

abstract class IDreamsRepository {
  Future<void> create(DreamEntity dream);
  Stream<List<DreamEntity>> getDreams();
  Future<void> update(DreamEntity dream);
  Future<void> delete(int id);
}
