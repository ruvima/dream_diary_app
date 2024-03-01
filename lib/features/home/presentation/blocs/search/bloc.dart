import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class SearchBloc extends Bloc<Event, State> {
  SearchBloc() : super(const InitialState(Model())) {
    on<SearchEvent>(_onSearchEvent);
  }

  void _onSearchEvent(SearchEvent event, Emitter emit) {
    print(state.model.searchTerm);
    emit(
      LoadedState(
        state.model.copyWith(
          showTextField: event.showTextField,
          searchTerm: event.searchTerm,
        ),
      ),
    );
  }
}
