import '../../../../core/core.dart';
import '../entities/suggestions_entity.dart';

abstract class ISuggestionsDatasource {
  Future<SuggestionsEntity> suggestions(SelectType type);
}
