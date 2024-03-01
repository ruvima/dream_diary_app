import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasource/suggestions_datasource_impl.dart';

class SuggestionsRepositotyImpl implements ISuggestionsRepositoty {
  const SuggestionsRepositotyImpl(
      {required SuggestionsDatasourceImpl suggestionsDatasource})
      : _suggestionsDatasource = suggestionsDatasource;

  final SuggestionsDatasourceImpl _suggestionsDatasource;

  @override
  Future<SuggestionsEntity> suggestions(SelectType type) {
    return _suggestionsDatasource.suggestions(type);
  }
}
