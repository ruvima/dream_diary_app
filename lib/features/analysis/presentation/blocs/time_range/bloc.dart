import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';

part 'event.dart';
part 'state.dart';

class TimeRangeBloc extends Bloc<Event, State> {
  TimeRangeBloc() : super(const InitialState(Model())) {
    on<ChangeTimeRangeEvent>(_onChangeTimeRangeEvent);
  }

  void _onChangeTimeRangeEvent(
    ChangeTimeRangeEvent event,
    Emitter<State> emit,
  ) {
    emit(
      LoadedState(
        state.model.copyWith(
          timeRange: event.timeRange,
        ),
      ),
    );
  }
}
