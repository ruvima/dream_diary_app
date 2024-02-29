import '../domain.dart';
import '../entities/dream_entity.dart';

class GetDreamsUsecase {
  const GetDreamsUsecase({
    required IDreamsRepository iIDreamsRepository,
  }) : _iIDreamsRepository = iIDreamsRepository;

  final IDreamsRepository _iIDreamsRepository;

  Stream<List<DreamEntity>> execute() => _iIDreamsRepository.getDreams();
}
