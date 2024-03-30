import '../../../../core/core.dart';
import '../domain.dart';

abstract class IDreamsRepository {
  Future<void> create(DreamEntity dream);
  Stream<List<DreamEntity>> getDreams(String? searchTerm);
  Stream<List<DreamEntity>> getFilteredDreams(FilterRequestModel param);
  Future<void> update(DreamEntity dream);
  Future<void> delete(int id);
}
