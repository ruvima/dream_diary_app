import '../../domain/domain.dart';

class SuggestionsModel extends SuggestionsEntity {
  const SuggestionsModel({
    required super.eng,
    required super.es,
  });

  factory SuggestionsModel.fromJson(Map<String, dynamic> json) {
    return SuggestionsModel(
      eng: List.from(json['eng'] as List<dynamic>),
      es: List.from(json['es'] as List<dynamic>),
    );
  }
}
