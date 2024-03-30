import 'dart:async';

import 'package:d_chart/d_chart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/core.dart';
import '../../../../home/domain/domain.dart';
import '../time_range/bloc.dart';

part 'event.dart';
part 'state.dart';

class AnalysisDreamBloc extends Bloc<Event, State> {
  AnalysisDreamBloc({
    GetFilteredDreamsUsecase? dreamsUsecase,
    required TimeRangeBloc rangeBloc,
  })  : _dreamsUsecase =
            dreamsUsecase ?? Modular.get<GetFilteredDreamsUsecase>(),
        _rangeBloc = rangeBloc,
        super(const InitialState(Model())) {
    on<LoadDreamsEvent>(_onLoadDreamEvent);
    on<LoadingEvent>(_onLoadingEvent);
    init();
  }

  late StreamSubscription _rangeSubscription;

  final GetFilteredDreamsUsecase _dreamsUsecase;

  final TimeRangeBloc _rangeBloc;

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

  void init() {
    add(LoadingEvent());

    _rangeSubscription = _rangeBloc.stream.listen((event) {
      _dreamsUsecase
          .execute(
        FilterRequestModel(
          timeRange: event.model.timeRange,
        ),
      )
          .listen((dreams) {
        add(LoadDreamsEvent(dreams: dreams));
      });
    });
  }

  void _onLoadingEvent(LoadingEvent event, Emitter emit) async {
    emit(LoadingState(state.model));
  }

  @override
  Future<void> close() async {
    await _rangeSubscription.cancel();

    super.close();
  }
}
