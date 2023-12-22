part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class FormSavedEvent extends Event {
  @override
  List<Object> get props => [];
}

class FormTypeChangedEvent extends Event {
  const FormTypeChangedEvent(this.formType);

  final FormType formType;

  @override
  List<Object> get props => [formType];
}

class EnterFormEvent extends Event {
  const EnterFormEvent({this.dreamEntity});

  final DreamEntity? dreamEntity;

  @override
  List<Object?> get props => [dreamEntity];
}

class DateChangedEvent extends Event {
  final DateTime date;

  const DateChangedEvent(this.date);

  @override
  List<Object> get props => [date];
}

class ClarityChangedEvent extends Event {
  final double clarity;

  const ClarityChangedEvent(this.clarity);

  @override
  List<Object> get props => [clarity];
}

class DreamTypesChangedEvent extends Event {
  final String dreamType;

  const DreamTypesChangedEvent(this.dreamType);

  @override
  List<Object> get props => [dreamType];
}

class EmotionsChangedEvent extends Event {
  final String emotion;

  const EmotionsChangedEvent(this.emotion);

  @override
  List<Object> get props => [emotion];
}

class PeopleChangedEvent extends Event {
  final String person;

  const PeopleChangedEvent(this.person);

  @override
  List<Object> get props => [person];
}

class PlaceChangedEvent extends Event {
  final String place;

  const PlaceChangedEvent(this.place);

  @override
  List<Object> get props => [place];
}

class TagsChangedEvent extends Event {
  final String tag;

  const TagsChangedEvent(this.tag);

  @override
  List<Object> get props => [tag];
}

class DescriptionChangedEvent extends Event {
  final String description;

  const DescriptionChangedEvent(this.description);

  @override
  List<Object> get props => [description];
}

class TitleChangedEvent extends Event {
  final String title;

  const TitleChangedEvent(this.title);

  @override
  List<Object> get props => [title];
}
