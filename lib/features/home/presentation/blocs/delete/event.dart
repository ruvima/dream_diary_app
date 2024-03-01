part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class DeleteDreamEvent extends Event {
  const DeleteDreamEvent(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
