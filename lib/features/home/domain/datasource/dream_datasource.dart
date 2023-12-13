import '../domain.dart';

abstract class DreamDatasource {
  Future<List<DreamEntity>> fetchDreams();
}
