part of 'bloc.dart';

abstract class State extends Equatable {
  const State(this.model);
  final Model model;

  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(super.model);
}

class CalendarChangedState extends State {
  const CalendarChangedState(super.model);
}

class Model extends Equatable {
  Model({
    DateTime? focusedDatetime,
    DateTime? selectedDayDatetime,
    this.dreams = const [],
    this.calendarFormat = CalendarFormat.week,
  })  : focusedDay = focusedDatetime ?? DateTime.now(),
        selectedDay = selectedDayDatetime ?? DateTime.now();

  final DateTime focusedDay;
  final DateTime selectedDay;
  final CalendarFormat calendarFormat;
  final List<DreamEntity> dreams;

  @override
  List<Object> get props => [
        focusedDay,
        calendarFormat,
        selectedDay,
        dreams,
      ];

  Model copyWith({
    DateTime? focusedDay,
    DateTime? selectedDay,
    CalendarFormat? calendarFormat,
    List<DreamEntity>? dreams,
  }) {
    return Model(
      focusedDatetime: focusedDay ?? this.focusedDay,
      selectedDayDatetime: selectedDay ?? this.selectedDay,
      calendarFormat: calendarFormat ?? this.calendarFormat,
      dreams: dreams ?? this.dreams,
    );
  }
}
