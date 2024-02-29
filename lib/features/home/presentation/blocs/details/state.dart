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
  const Model({this.dreamEntity, this.error = ''});

  final DreamEntity? dreamEntity;
  final String error;

  @override
  List<Object?> get props => [
        dreamEntity,
        error,
      ];

  Model copyWith({
    DreamEntity? dreamEntity,
    String? error,
  }) {
    return Model(
      dreamEntity: dreamEntity ?? this.dreamEntity,
      error: error ?? this.error,
    );
  }
}
