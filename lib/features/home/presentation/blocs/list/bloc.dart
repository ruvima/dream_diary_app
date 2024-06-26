import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/shared/errors/failures/failures.dart';
import '../../../domain/domain.dart';
import '../search/bloc.dart';

part 'event.dart';
part 'state.dart';

class DreamBloc extends Bloc<Event, State> {
  DreamBloc({
    GetDreamsUsecase? fetchDreams,
    DeleteDreamUsecase? deleteDream,
    required this.searchBloc,
  })  : _fetchDreams = fetchDreams ?? Modular.get<GetDreamsUsecase>(),
        super(const InitialState(Model())) {
    on<LoadDreamsEvent>(_onLoadDreamEvent);
    on<LoadingEvent>(_onLoadingEvent);
    init();
  }
  late StreamSubscription _searchSubscription;
  final SearchBloc searchBloc;

  final GetDreamsUsecase _fetchDreams;

  void init() {
    add(LoadingEvent());

    _searchSubscription = searchBloc.stream.listen((event) {
      _fetchDreams.execute(searchTerm: event.model.searchTerm).listen(
        (dreams) {
          add(LoadDreamsEvent(dreams: dreams));
        },
      );
    });
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

  void _onLoadingEvent(LoadingEvent event, Emitter emit) async {
    emit(LoadingState(state.model));
  }

  @override
  Future<void> close() async {
    await _searchSubscription.cancel();
    super.close();
  }
}
