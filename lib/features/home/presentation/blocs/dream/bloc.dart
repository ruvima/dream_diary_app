import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/shared/errors/failures/failures.dart';
import '../../../domain/domain.dart';

part 'event.dart';
part 'state.dart';

class DreamBloc extends Bloc<Event, State> {
  DreamBloc({
    GetDreamsUsecase? fetchDreams,
    DeleteDreamUsecase? deleteDream,
  })  : _fetchDreams = fetchDreams ?? Modular.get<GetDreamsUsecase>(),
        _deleteDream = deleteDream ?? Modular.get<DeleteDreamUsecase>(),
        super(const InitialState(Model())) {
    on<LoadDreamsEvent>(_onLoadDreamEvent);
    on<DeleteDreamEvent>(_onDeleteDreamEvent);
    on<InitEvenet>(_onInitEvent);
  }
  final GetDreamsUsecase _fetchDreams;
  final DeleteDreamUsecase _deleteDream;
  late StreamSubscription _dreamsSubscription;

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
