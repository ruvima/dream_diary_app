import '../../../../core/shared/domain/entities/dream_entity.dart';
import '../domain.dart';

class FetchDreams {
  const FetchDreams({
    required DreamRepository repository,
  }) : _repository = repository;

  final DreamRepository _repository;

  Stream<List<DreamEntity>> execute() => _repository.getDreams();
}

class DeleteDream {
  const DeleteDream({
    required DreamRepository repository,
  }) : _repository = repository;
  final DreamRepository _repository;

  Future<void> execute(int id) => _repository.delete(id);
}
