import '../../../../core/core.dart';
import '../domain.dart';

class SuggestionsUsecase {
  const SuggestionsUsecase({
    required ISuggestionsRepositoty iSuggestionsRepositoty,
  }) : _iSuggestionsRepositoty = iSuggestionsRepositoty;

  final ISuggestionsRepositoty _iSuggestionsRepositoty;

  Future<SuggestionsEntity> execute(SelectType type) =>
      _iSuggestionsRepositoty.suggestions(type);
}
