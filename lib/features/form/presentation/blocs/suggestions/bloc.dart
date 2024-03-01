import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

part 'event.dart';
part 'state.dart';

class SuggestionsBloc extends Bloc<Event, State> {
  SuggestionsBloc({
    SuggestionsUsecase? suggestions,
  })  : _suggestionsUsecase = suggestions ?? Modular.get<SuggestionsUsecase>(),
        super(
          const InitialState(Model()),
        ) {
    on<GetSuggestions>(_onGetSuggestions);
  }

  final SuggestionsUsecase _suggestionsUsecase;

  Future<void> _onGetSuggestions(
    GetSuggestions event,
    Emitter<State> emit,
  ) async {
    emit(LoadingState(state.model));

    try {
      final response = await _suggestionsUsecase.execute(
        event.selectType,
      );

      emit(
        LoadedState(
          state.model.copyWith(suggestionsEntity: response),
        ),
      );
    } catch (e) {
      emit(
        ErrorState(
          state.model.copyWith(error: '$e'),
        ),
      );
    }
  }
}
