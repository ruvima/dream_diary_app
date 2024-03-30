part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object> get props => [];
}

class FocusedDayChangedEvent extends Event {
  const FocusedDayChangedEvent({
    required this.focusedDay,
  });

  final DateTime focusedDay;

  @override
  List<Object> get props => [focusedDay];
}

class SelectedDayChangedEvent extends Event {
  const SelectedDayChangedEvent({
    required this.selectedDay,
  });

  final DateTime selectedDay;

  @override
  List<Object> get props => [selectedDay];
}

class FormatChangedEvent extends Event {
  const FormatChangedEvent({
    required this.format,
  });

  final CalendarFormat format;

  @override
  List<Object> get props => [format];
}

class FilterByDayEvent extends Event {
  const FilterByDayEvent({
    required this.day,
  });

  final DateTime day;

  @override
  List<Object> get props => [day];
}
