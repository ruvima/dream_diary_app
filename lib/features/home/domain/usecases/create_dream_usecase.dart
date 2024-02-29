import '../domain.dart';
import '../entities/dream_entity.dart';

class CreateDreamUsecase {
  const CreateDreamUsecase({
    required IDreamsRepository iIDreamsRepository,
  }) : _iDreamsRepository = iIDreamsRepository;

  final IDreamsRepository _iDreamsRepository;
  Future<void> execute(DreamEntity dream) => _iDreamsRepository.create(
        dream,
      );
}
