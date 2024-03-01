import 'package:equatable/equatable.dart';

class SuggestionsEntity extends Equatable {
  const SuggestionsEntity({
    required this.eng,
    required this.es,
  });

  final List<String> eng;
  final List<String> es;

  @override
  List<Object> get props => [
        eng,
        es,
      ];
}
