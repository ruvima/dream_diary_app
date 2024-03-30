import '../../../home/domain/domain.dart';

abstract class SearchRepository {
  Future<List<DreamEntity>> getDreams();
}
