part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object> get props => [];
}

class InitEvenet extends Event {}

class LoadDreamsEvent extends Event {
  const LoadDreamsEvent({
    required this.dreams,
  });

  final List<DreamEntity> dreams;

  @override
  List<Object> get props => [dreams];
}

class DeleteDreamEvent extends Event {
  const DeleteDreamEvent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
