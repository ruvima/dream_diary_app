import '../../../home/domain/domain.dart';
import '../repository/search_repository.dart';

class FetchDream {
  final SearchRepository repository;
  FetchDream(this.repository);

  Future<List<DreamEntity>> execute() => repository.getDreams();
}
