import '../../../../core/core.dart';
import '../entities/suggestions_entity.dart';

abstract class ISuggestionsRepositoty {
  Future<SuggestionsEntity> suggestions(SelectType type);
}
