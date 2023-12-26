import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/domain/domain.dart';
import '../../domain/usecases/dream_usecases.dart';

part 'event.dart';
part 'state.dart';

class DreamBloc extends Bloc<Event, State> {
  final FetchDreams _fetchDreams;
  final DeleteDream _deleteDream;

  late StreamSubscription _dreamsSubscription;

  DreamBloc({
    required FetchDreams fetchDreams,
    required DeleteDream deleteDream,
  })  : _fetchDreams = fetchDreams,
        _deleteDream = deleteDream,
        super(const InitialState(Model())) {
    on<LoadDreamsEvent>(_onLoadDreamEvent);
    on<DeleteDreamEvent>(_onDeleteDreamEvent);
    on<InitEvenet>(_onInitEvent);
  }

  void _onInitEvent(InitEvenet event, Emitter emit) {
    emit(LoadingState(state.model));
    _dreamsSubscription = _fetchDreams.execute().listen(
      (dreams) {
        add(LoadDreamsEvent(dreams: dreams));
      },
    );
  }

  void _onLoadDreamEvent(LoadDreamsEvent event, Emitter emit) async {
    emit(LoadingState(state.model));
    try {
      emit(DreamsLoaded(state.model.copyWith(dreams: event.dreams)));
    } catch (e) {
      final errorMessage =
          e is DatabaseFailure ? e.message : 'An unexpected error occurred';
      emit(
        ErrorState(
          state.model.copyWith(error: errorMessage),
        ),
      );
    }
  }

  Future<void> _onDeleteDreamEvent(DeleteDreamEvent event, Emitter emit) async {
    emit(LoadingState(state.model));

    try {
      await _deleteDream.execute(event.id);
    } catch (e) {
      final errorMessage =
          e is DatabaseFailure ? e.message : 'An unexpected error occurred';
      emit(
        ErrorState(
          state.model.copyWith(error: errorMessage),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _dreamsSubscription.cancel();
    super.close();
  }
}
