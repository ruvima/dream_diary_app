import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class NavigationBloc extends Bloc<Event, State> {
  NavigationBloc() : super(const InitialState(model: Model())) {
    on<ChangeIndexEvent>(_onChangedIndexEvent);
  }

  FutureOr<void> _onChangedIndexEvent(ChangeIndexEvent event, Emitter emit) {
    emit(LoadingState(model: state.model));

    if (state.model.currentIndex != NavigationAction.add.index) {
      emit(
        NavigationState(
          model: state.model.copyWith(
            previousIndex: state.model.currentIndex,
          ),
        ),
      );
    }

    emit(
      NavigationState(
        model: state.model.copyWith(
          currentIndex: event.currentIndex,
        ),
      ),
    );
  }
}
