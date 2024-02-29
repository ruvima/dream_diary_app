part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class FormSavedEvent extends Event {
  const FormSavedEvent({
    required this.dreamEntity,
    required this.formType,
  });

  final DreamEntity dreamEntity;
  final FormType formType;
  @override
  List<Object> get props => [dreamEntity];
}
