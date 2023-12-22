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
    String? uuid,
    this.clarity = 0.0,
    this.description = '',
    this.dreamTypes = const [],
    this.emotions = const [],
    this.people = const [],
    this.places = const [],
    this.tags = const [],
    this.title = '',
    this.formType = FormType.create,
    this.dreamEntity,
    this.error = '',
  })  : id = uuid ?? const Uuid().v4(),
        date = dateTime ?? DateTime.now();

  final DateTime date;
  final double clarity;
  final List<String> dreamTypes;
  final List<String> emotions;
  final List<String> people;
  final List<String> places;
  final List<String> tags;
  final String description;
  final String id;
  final String title;
  final FormType formType;
  final DreamEntity? dreamEntity;
  final String error;

  DreamEntity toEntity() {
    return DreamEntity(
      clarity: clarity,
      date: date,
      description: description,
      dreamTypes: dreamTypes,
      emotions: emotions,
      id: id,
      people: people,
      places: places,
      tags: tags,
      title: title,
    );
  }

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
      description,
      id,
      title,
      formType,
      dreamEntity,
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
    String? description,
    String? id,
    String? title,
    FormType? formType,
    DreamEntity? dreamEntity,
  }) {
    return Model(
      dateTime: date ?? this.date,
      clarity: clarity ?? this.clarity,
      dreamTypes: dreamTypes ?? this.dreamTypes,
      emotions: emotions ?? this.emotions,
      people: people ?? this.people,
      places: places ?? this.places,
      tags: tags ?? this.tags,
      description: description ?? this.description,
      uuid: id ?? this.id,
      title: title ?? this.title,
      formType: formType ?? this.formType,
      dreamEntity: dreamEntity ?? this.dreamEntity,
    );
  }
}
