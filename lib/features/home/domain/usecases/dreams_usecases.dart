import '../domain.dart';

class GetDreamsUsecase {
  const GetDreamsUsecase({
    required IDreamsRepository iIDreamsRepository,
  }) : _iIDreamsRepository = iIDreamsRepository;

  final IDreamsRepository _iIDreamsRepository;

  Stream<List<DreamEntity>> execute({String? searchTerm}) =>
      _iIDreamsRepository.getDreams(searchTerm);
}
