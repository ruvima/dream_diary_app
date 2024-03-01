import '../domain.dart';

abstract class IDreamsRepository {
  Future<void> create(DreamEntity dream);
  Stream<List<DreamEntity>> getDreams(String? searchTerm);
  Future<void> update(DreamEntity dream);
  Future<void> delete(int id);
}
