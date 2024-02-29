import '../repositories/dreams_repository.dart';

class DeleteDreamUsecase {
  const DeleteDreamUsecase({
    required IDreamsRepository iIDreamsRepository,
  }) : _iIDreamsRepository = iIDreamsRepository;
  final IDreamsRepository _iIDreamsRepository;

  Future<void> execute(int id) => _iIDreamsRepository.delete(id);
}
