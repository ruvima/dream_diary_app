part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class EditFormEvent extends Event {
  const EditFormEvent({
    this.date,
    this.clarity,
    this.dreamType,
    this.emotion,
    this.person,
    this.place,
    this.tag,
  });

  final DateTime? date;
  final double? clarity;
  final String? dreamType;
  final String? emotion;
  final String? person;
  final String? place;
  final String? tag;

  @override
  List<Object?> get props => [
        date,
        clarity,
        dreamType,
        emotion,
        person,
        place,
        tag,
      ];
}

class InitialValuesEvent extends Event {
  const InitialValuesEvent({
    required this.date,
    required this.clarity,
    required this.dreamTypes,
    required this.emotions,
    required this.people,
    required this.places,
    required this.tags,
  });

  final DateTime date;
  final double clarity;
  final List<String> dreamTypes;
  final List<String> emotions;
  final List<String> people;
  final List<String> places;
  final List<String> tags;
}
