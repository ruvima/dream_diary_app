part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object> get props => [];
}

class LoadDreamsEvent extends Event {}

class AddDreamEvent extends Event {
  const AddDreamEvent({
    required this.dreamEntity,
  });

  final DreamEntity dreamEntity;

  @override
  List<Object> get props => [dreamEntity];
}

class UpdateDreamEvent extends Event {}

class DeleteDreamEvent extends Event {}
