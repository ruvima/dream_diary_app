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

class ErrorState extends State {
  const ErrorState(super.model);
}

class FormSavedState extends State {
  const FormSavedState(super.model);
}

class FormChangedState extends State {
  const FormChangedState(Model model) : super(model);
}

class Model extends Equatable {
  Model({
    DateTime? dateTime,
    this.clarity = 0.0,
    this.dreamTypes = const [],
    this.emotions = const [],
    this.people = const [],
    this.places = const [],
    this.tags = const [],
    this.error = '',
  }) : date = dateTime ?? DateTime.now();

  final DateTime date;
  final double clarity;
  final List<String> dreamTypes;
  final List<String> emotions;
  final List<String> people;
  final List<String> places;
  final List<String> tags;

  final String error;

  @override
  List<Object?> get props {
    return [
      date,
      clarity,
      dreamTypes,
      emotions,
      people,
      places,
      tags,
    ];
  }

  Model copyWith({
    DateTime? date,
    double? clarity,
    List<String>? dreamTypes,
    List<String>? emotions,
    List<String>? people,
    List<String>? places,
    List<String>? tags,
    String? error,
  }) {
    return Model(
      dateTime: date ?? this.date,
      clarity: clarity ?? this.clarity,
      dreamTypes: dreamTypes ?? this.dreamTypes,
      emotions: emotions ?? this.emotions,
      people: people ?? this.people,
      places: places ?? this.places,
      tags: tags ?? this.tags,
      error: error ?? this.error,
    );
  }
}
