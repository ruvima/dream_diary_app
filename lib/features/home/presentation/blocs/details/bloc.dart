import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'event.dart';
part 'state.dart';

class DetailsBloc extends Bloc<Event, State> {
  DetailsBloc() : super(const InitialState(Model())) {
    on<AddDreamEvent>(_onAddDreamEvent);
  }

  void _onAddDreamEvent(
    AddDreamEvent event,
    Emitter<State> emit,
  ) {
    emit(
      LoadedState(
        state.model.copyWith(dreamEntity: event.dreamEntity),
      ),
    );
  }
}
