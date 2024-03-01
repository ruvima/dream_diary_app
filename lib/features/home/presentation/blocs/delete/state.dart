part of 'bloc.dart';

abstract class State extends Equatable {
  const State(this.model);

  final Model model;

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

class ErrorState extends State {
  const ErrorState(super.model);
}

class Model extends Equatable {
  const Model({
    this.error = '',
  });

  final String error;

  Model copyWith({
    String? error,
  }) {
    return Model(
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [error];
}
