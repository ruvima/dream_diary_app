import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/domain/domain.dart';
import '../../domain/domain.dart';

part 'event.dart';
part 'state.dart';

class DreamBloc extends Bloc<Event, State> {
  final LocalStorageRepository _localStorageRepository;

  DreamBloc({
    required LocalStorageRepository localStorageRepository,
  })  : _localStorageRepository = localStorageRepository,
        super(const InitialState(Model())) {
    on<LoadDreamsEvent>(_onLoadDreamEvent);
    on<AddDreamEvent>(_onAddDreamEvent);
    on<UpdateDreamEvent>(_onUpdateDreamEvent);
    on<DeleteDreamEvent>(_onDeleteDreamEvent);
  }

  FutureOr<void> _onLoadDreamEvent(LoadDreamsEvent event, Emitter emit) async {
    emit(LoadingState(state.model));

    try {
      debugPrint('_onLoadDreamEvent: ${state.model.dreams.length}');
      final dreams = await _localStorageRepository.getDreams();

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

  FutureOr<void> _onAddDreamEvent(AddDreamEvent event, Emitter emit) async {
    emit(LoadingState(state.model));

    try {
      final oldDreams = state.model.dreams;
      debugPrint('_onAddDreamEvent: ${oldDreams.length}');

      final saveOnStorage =
          await _localStorageRepository.create(event.dreamEntity);

      if (saveOnStorage) {
        final dreams = [event.dreamEntity, ...oldDreams];
        debugPrint('_onAddDreamEvent: ${dreams.length}');
        emit(
          DreamsLoaded(
            state.model.copyWith(dreams: dreams),
          ),
        );
      }
    } catch (e) {
      emit(
        ErrorState(
          state.model.copyWith(error: '$e'),
        ),
      );
    }
  }

  FutureOr<void> _onUpdateDreamEvent(UpdateDreamEvent event, Emitter emit) {}
  FutureOr<void> _onDeleteDreamEvent(DeleteDreamEvent event, Emitter emit) {}
}
