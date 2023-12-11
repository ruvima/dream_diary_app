part of 'bloc.dart';

@immutable
abstract class Event extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeIndexEvent extends Event {
  final int currentIndex;
  ChangeIndexEvent({
    required this.currentIndex,
  });

  @override
  List<Object?> get props => [currentIndex];
}

 