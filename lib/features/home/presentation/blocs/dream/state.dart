part of 'bloc.dart';

abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [];
}

class InitialState extends State {
  const InitialState(super.model);
}

class LoadingState extends State {
  const LoadingState(super.model);
}

class DreamsLoaded extends State {
  const DreamsLoaded(super.model);
}

class ErrorState extends State {
  const ErrorState(super.model);
}

class Model extends Equatable {
  final List<DreamEntity> dreams;
  final String error;
  const Model({
    this.dreams = const [],
    this.error = '',
  });

  @override
  List<Object?> get props => [dreams, error];

  Model copyWith({
    List<DreamEntity>? dreams,
    String? error,
  }) {
    return Model(
      dreams: dreams ?? this.dreams,
      error: error ?? this.error,
    );
  }
}
