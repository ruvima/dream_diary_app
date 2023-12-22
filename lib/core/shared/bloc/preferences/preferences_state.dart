part of 'preferences_bloc.dart';

abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

final class InitialState extends State {
  const InitialState(super.model);
}

final class PreferenceChangeState extends State {
  const PreferenceChangeState(super.model);
}

final class LanguageChangeState extends State {
  const LanguageChangeState(super.model);
}

class Model extends Equatable {
  final bool isDarkMode;
  final String languageCode;
  const Model({
    this.isDarkMode = true,
    this.languageCode = 'es',
  });

  @override
  List<Object> get props => [isDarkMode, languageCode];

  Model copyWith({
    bool? isDarkMode,
    String? languageCode,
  }) {
    return Model(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
    );
  }
}
