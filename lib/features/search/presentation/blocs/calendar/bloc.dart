import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../home/domain/domain.dart';

part 'event.dart';
part 'state.dart';

class CalendarBloc extends Bloc<Event, State> {
  CalendarBloc() : super(InitialState(Model())) {
    on<FocusedDayChangedEvent>(_onPageChangedEvent);
    on<SelectedDayChangedEvent>(_onSelectedDayChangedEvent);
    on<FormatChangedEvent>(_onFormatChangedEvent);
    on<FilterByDayEvent>(_onFilterByDayEvent);
  }

  void _onPageChangedEvent(FocusedDayChangedEvent event, Emitter emit) {
    emit(
      CalendarChangedState(
        state.model.copyWith(focusedDay: event.focusedDay),
      ),
    );
  }

  void _onSelectedDayChangedEvent(SelectedDayChangedEvent event, Emitter emit) {
    emit(
      CalendarChangedState(
        state.model.copyWith(selectedDay: event.selectedDay),
      ),
    );
  }

  void _onFormatChangedEvent(FormatChangedEvent event, Emitter emit) {
    emit(
      CalendarChangedState(
        state.model.copyWith(calendarFormat: event.format),
      ),
    );
  }

  void _onFilterByDayEvent(FilterByDayEvent event, Emitter emit) {
    final dreams = _getDreamsForDay(event.day);
    emit(
      CalendarChangedState(
        state.model.copyWith(dreams: dreams),
      ),
    );
  }
}

List<DreamEntity> _getDreamsForDay(DateTime day) {
  return dreamEntities.where((e) => isSameDay(e.date, day)).toList();
}

List<DreamEntity> dreamEntities = [
  DreamEntity(
    clarity: 75.0,
    date: DateTime.now(),
    description: 'A fascinating dream about flying',
    dreamTypes: ['Lucid'],
    emotions: ['Excited'],
    people: ['Friend'],
    places: ['Sky'],
    tags: ['Adventure'],
    title: 'Flying High',
  ),
  DreamEntity(
    clarity: 75.0,
    date: DateTime(2023, 12, 10),
    description: 'A fascinating dream about flying',
    dreamTypes: ['Lucid'],
    emotions: ['Excited'],
    people: ['Friend'],
    places: ['Sky'],
    tags: ['Adventure'],
    title: 'Flying High',
  ),
  DreamEntity(
    clarity: 60.0,
    date: DateTime(2023, 12, 5),
    description: 'Nightmare with mysterious creatures',
    dreamTypes: ['Nightmare'],
    emotions: ['Scared'],
    people: ['Unknown'],
    places: ['Dark Forest'],
    tags: ['Horror'],
    title: 'Creepy Encounter',
  ),
  // ... Agrega aquí las otras 8 instancias de DreamEntity ...
  DreamEntity(
    clarity: 90.0,
    date: DateTime(2023, 11, 28),
    description: 'Joyful dream with friends and laughter',
    dreamTypes: ['Adventure'],
    emotions: ['Happy'],
    people: ['Friends'],
    places: ['Amusement Park'],
    tags: ['Fun'],
    title: 'Memorable Moments',
  ),
];
