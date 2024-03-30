import '../../../../core/core.dart';
import '../domain.dart';

class GetFilteredDreamsUsecase {
  const GetFilteredDreamsUsecase({
    required IDreamsRepository iIDreamsRepository,
  }) : _iIDreamsRepository = iIDreamsRepository;

  final IDreamsRepository _iIDreamsRepository;

  Stream<List<DreamEntity>> execute(FilterRequestModel param) =>
      _iIDreamsRepository.getFilteredDreams(param);
}
