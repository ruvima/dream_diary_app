part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object> get props => [];
}

class LoadDreamsEvent extends Event {
  const LoadDreamsEvent({
    required this.dreams,
  });

  final List<DreamEntity> dreams;

  @override
  List<Object> get props => [dreams];
}

class LoadingEvent extends Event {}
