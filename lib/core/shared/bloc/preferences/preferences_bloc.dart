import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core.dart';
import '../../local/shared_pref/key_value_storage_service.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<Event, State> {
  PreferencesBloc({
    required KeyValueStorageService keyValueStorageService,
  })  : _keyValueStorageService = keyValueStorageService,
        super(const InitialState(Model())) {
    on<LoadingPrefsEvent>(_onLoadingPrefs);
    on<ThemeModeChangedEvent>(_onThemeModeChanged);
    on<LanguageChangedEvent>(_onLanguageChanged);
  }

  final KeyValueStorageService _keyValueStorageService;

  Future<void> _onLoadingPrefs(LoadingPrefsEvent event, Emitter emit) async {
    final isDarkMode = await _keyValueStorageService.getValue<bool>(
      SharedPrefKeys.isDarkMode,
    );
    final languageCode = await _keyValueStorageService.getValue<String>(
      SharedPrefKeys.language,
    );

    await Future.delayed(const Duration(seconds: 4));

    emit(
      LoadedState(
        state.model.copyWith(
          isDarkMode: isDarkMode ?? state.model.isDarkMode,
          languageCode: languageCode ?? state.model.languageCode,
        ),
      ),
    );
  }

  Future<void> _onThemeModeChanged(
      ThemeModeChangedEvent event, Emitter emit) async {
    await _keyValueStorageService.setKeyValue(
      SharedPrefKeys.isDarkMode,
      event.isDarkMode,
    );

    emit(
      LoadedState(
        state.model.copyWith(isDarkMode: event.isDarkMode),
      ),
    );
  }

  Future<void> _onLanguageChanged(
      LanguageChangedEvent event, Emitter emit) async {
    await _keyValueStorageService.setKeyValue(
      SharedPrefKeys.language,
      event.languageCode,
    );

    emit(
      LoadedState(
        state.model.copyWith(languageCode: event.languageCode),
      ),
    );
  }
}
