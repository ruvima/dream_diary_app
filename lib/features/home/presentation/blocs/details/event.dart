part of 'bloc.dart';

@immutable
abstract class Event extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddDreamEvent extends Event {
  final DreamEntity dreamEntity;
  AddDreamEvent({
    required this.dreamEntity,
  });
  @override
  List<Object?> get props => [dreamEntity];
}
