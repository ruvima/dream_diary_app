part of 'preferences_bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object> get props => [];
}

class ThemeModeChangedEvent extends Event {
  const ThemeModeChangedEvent(this.isDarkMode);

  final bool isDarkMode;
  @override
  List<Object> get props => [isDarkMode];
}

class LanguageChangedEvent extends Event {
  const LanguageChangedEvent(this.languageCode);
  final String languageCode;

  @override
  List<Object> get props => [languageCode];
}

class LoadingPrefsEvent extends Event {}
