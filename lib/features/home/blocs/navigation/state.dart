part of 'bloc.dart';

enum NavigationAction {
  home(0),
  analysis(1),
  form(2),
  search(3),
  tools(4);

  const NavigationAction(this.position);

  final int position;
}

@immutable
abstract class State extends Equatable {
  final Model model;
  const State({
    required this.model,
  });

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState({required super.model});
}

class LoadingState extends State {
  const LoadingState({required super.model});
}

class NavigationState extends State {
  const NavigationState({required super.model});
}

class Model extends Equatable {
  const Model({
    this.currentIndex = 0,
    this.previousIndex = 0,
  });
  final int currentIndex;
  final int previousIndex;

  @override
  List<Object?> get props => [currentIndex, previousIndex];

  Model copyWith({
    int? currentIndex,
    int? previousIndex,
  }) {
    return Model(
      currentIndex: currentIndex ?? this.currentIndex,
      previousIndex: previousIndex ?? this.previousIndex,
    );
  }
}
