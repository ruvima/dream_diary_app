import '../../../../core/shared/domain/domain.dart';
import '../repositories/form_repository.dart';

class CreateDream {
  const CreateDream({
    required FormRepository repository,
  }) : _repository = repository;

  final FormRepository _repository;

  Future<void> execute(DreamEntity dream) => _repository.create(dream);
}

class UpdateDream {
  const UpdateDream({
    required FormRepository repository,
  }) : _repository = repository;

  final FormRepository _repository;

  Future<void> execute(DreamEntity dream) => _repository.update(dream);
}
