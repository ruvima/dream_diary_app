import '../../../home/domain/domain.dart';

abstract class SearchDatasource {
  Future<List<DreamEntity>> getDreams();
}
