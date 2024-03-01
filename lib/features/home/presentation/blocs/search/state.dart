part of 'bloc.dart';

@immutable
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

class Model extends Equatable {
  const Model({
    this.searchTerm,
    this.showTextField = false,
  });

  final String? searchTerm;
  final bool showTextField;

  @override
  List<Object?> get props => [
        searchTerm,
        showTextField,
      ];

  Model copyWith({
    String? searchTerm,
    bool? showTextField,
  }) {
    return Model(
      searchTerm: searchTerm ?? this.searchTerm,
      showTextField: showTextField ?? this.showTextField,
    );
  }
}
