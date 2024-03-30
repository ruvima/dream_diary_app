part of 'bloc.dart';

@immutable
abstract class Event extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeTimeRangeEvent extends Event {
  ChangeTimeRangeEvent({
    required this.timeRange,
  });

  final TimeRange timeRange;

  @override
  List<Object?> get props => [
        timeRange,
      ];
}
