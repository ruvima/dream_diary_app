import '../domain.dart';

abstract class DreamRepository {
  Future<List<DreamEntity>> fetchDreams();
}
