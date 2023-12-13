import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';

part 'event.dart';
part 'state.dart';

class DreamBloc extends Bloc<Event, State> {
  final DreamRepository _dreamRepository;

  DreamBloc({
    required DreamRepository dreamRepository,
  })  : _dreamRepository = dreamRepository,
        super(const InitialState(Model())) {
    on<LoadDreamsEvent>(_onLoadDreamEvent);
    on<AddDreamEvent>(_onAddDreamEvent);
    on<UpdateDreamEvent>(_onUpdateDreamEvent);
    on<DeleteDreamEvent>(_onDeleteDreamEvent);
  }

  FutureOr<void> _onLoadDreamEvent(LoadDreamsEvent event, Emitter emit) async {
    emit(LoadingState(state.model));
    try {
      final dreams = await _dreamRepository.fetchDreams();
      emit(
        DreamsLoaded(
          state.model.copyWith(dreams: dreams),
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

  FutureOr<void> _onAddDreamEvent(AddDreamEvent event, Emitter emit) {}
  FutureOr<void> _onUpdateDreamEvent(UpdateDreamEvent event, Emitter emit) {}
  FutureOr<void> _onDeleteDreamEvent(DeleteDreamEvent event, Emitter emit) {}
}
