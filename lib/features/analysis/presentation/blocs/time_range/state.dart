part of 'bloc.dart';

@immutable
abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(super.model);
}

class LoadingState extends State {
  const LoadingState(super.model);
}

class LoadedState extends State {
  const LoadedState(super.model);
}

class Model extends Equatable {
  const Model({
    this.timeRange,
  });
  final TimeRange? timeRange;

  Model copyWith({
    TimeRange? timeRange,
  }) {
    return Model(
      timeRange: timeRange ?? this.timeRange,
    );
  }

  @override
  List<Object?> get props => [
        timeRange,
      ];
}
