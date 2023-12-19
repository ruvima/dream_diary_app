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
    this.tags = const [],
    this.title = '',
  })  : id = uuid ?? const Uuid().v4(),
        date = dateTime ?? DateTime.now();

  final DateTime date;
  final double clarity;
  final List<String> dreamTypes;
  final List<String> emotions;
  final List<String> people;
  final List<String> tags;
  final String description;
  final String id;
  final String title;

  @override
  List<Object> get props {
    return [
      date,
      clarity,
      dreamTypes,
      emotions,
      people,
      tags,
      description,
      id,
      title,
    ];
  }

  Model copyWith({
    DateTime? date,
    double? clarity,
    List<String>? dreamTypes,
    List<String>? emotions,
    List<String>? people,
    List<String>? tags,
    String? description,
    String? id,
    String? title,
  }) {
    return Model(
      dateTime: date ?? this.date,
      clarity: clarity ?? this.clarity,
      dreamTypes: dreamTypes ?? this.dreamTypes,
      emotions: emotions ?? this.emotions,
      people: people ?? this.people,
      tags: tags ?? this.tags,
      description: description ?? this.description,
      uuid: id ?? this.id,
      title: title ?? this.title,
    );
  }

  DreamEntity toEntity() {
    return DreamEntity(
        date: date,
        clarity: clarity,
        dreamTypes: dreamTypes,
        emotions: emotions,
        people: people,
        tags: tags,
        description: description,
        id: id,
        title: title);
  }
}
