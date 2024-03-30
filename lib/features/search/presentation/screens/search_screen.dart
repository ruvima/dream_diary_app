import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/core.dart';
import '../blocs/calendar/bloc.dart' as calendar_bloc;

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<calendar_bloc.CalendarBloc, calendar_bloc.State>(
      bloc: Modular.get<calendar_bloc.CalendarBloc>(),
      buildWhen: (_, state) => state is calendar_bloc.CalendarChangedState,
      builder: (context, state) {
        final model = state.model;
        // return const TableEventsExample();
        // List<DreamEntity> selectDay(DateTime day) {
        //   Modular.get<calendar_bloc.CalendarBloc>().add(
        //     calendar_bloc.FilterByDayEvent(
        //       day: day,
        //     ),
        //   );

        //   return model.dreams;
        // }

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: KSizes.p12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const KHeadline4('Search'),
                gapH8,
                const SizedBox(
                    height: 35,
                    child: KTextFormField(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: KSizes.p8),
                        hint: 'Search keyword')),
                gapH8,
                TableCalendar(
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: (context, day, focusedDay) {
                      return null;
                    },
                  ),
                  calendarFormat: model.calendarFormat,
                  focusedDay: model.focusedDay,
                  firstDay: DateTime.utc(2010),
                  lastDay: DateTime.now(),
                  selectedDayPredicate: (day) =>
                      isSameDay(day, model.selectedDay),
                  eventLoader: (day) {
                    print(day);

                    return state.model.dreams;
                  },
                  onPageChanged: (focusedDay) {
                    Modular.get<calendar_bloc.CalendarBloc>().add(
                      calendar_bloc.FocusedDayChangedEvent(
                        focusedDay: focusedDay,
                      ),
                    );
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    Modular.get<calendar_bloc.CalendarBloc>().add(
                      calendar_bloc.SelectedDayChangedEvent(
                        selectedDay: selectedDay,
                      ),
                    );
                    Modular.get<calendar_bloc.CalendarBloc>().add(
                      calendar_bloc.FocusedDayChangedEvent(
                        focusedDay: focusedDay,
                      ),
                    );
                  },
                  onFormatChanged: (format) {
                    Modular.get<calendar_bloc.CalendarBloc>().add(
                      calendar_bloc.FormatChangedEvent(
                        format: format,
                      ),
                    );
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        color: Colors.red,
                        height: 50,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class TableEventsExample extends StatefulWidget {
//   const TableEventsExample({super.key});

//   @override
//   _TableEventsExampleState createState() => _TableEventsExampleState();
// }

// class _TableEventsExampleState extends State<TableEventsExample> {
//   late final ValueNotifier<List<DreamEntity>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;

//   @override
//   void initState() {
//     super.initState();

//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getDreamsForDay(_selectedDay!));
//   }

//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }

//   List<DreamEntity> _getDreamsForDay(DateTime day) {
//     return dreamEntities.where((de) => isSameDay(de.date, day)).toList();
//   }

//   List<DreamEntity> _getDreamsForRange(DateTime start, DateTime end) {
//     final days = daysInRange(start, end);

//     return [
//       for (final d in days) ..._getDreamsForDay(d),
//     ];
//   }

//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _rangeStart = null; // Important to clean those
//         _rangeEnd = null;
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });

//       _selectedEvents.value = _getDreamsForDay(selectedDay);
//     }
//   }

//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = null;
//       _focusedDay = focusedDay;
//       _rangeStart = start;
//       _rangeEnd = end;
//       _rangeSelectionMode = RangeSelectionMode.toggledOn;
//     });

//     // `start` or `end` could be null
//     if (start != null && end != null) {
//       _selectedEvents.value = _getDreamsForRange(start, end);
//     } else if (start != null) {
//       _selectedEvents.value = _getDreamsForDay(start);
//     } else if (end != null) {
//       _selectedEvents.value = _getDreamsForDay(end);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TableCalendar - Events'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar<DreamEntity>(
//             firstDay: kFirstDay, //-------------
//             lastDay: kLastDay, //-------------
//             focusedDay: _focusedDay, //-------------
//             selectedDayPredicate: (day) =>
//                 isSameDay(_selectedDay, day), //-------------
//             rangeStartDay: _rangeStart,
//             rangeEndDay: _rangeEnd,
//             calendarFormat: _calendarFormat, //-------------
//             rangeSelectionMode: _rangeSelectionMode, //-------------
//             eventLoader: _getDreamsForDay,

//             startingDayOfWeek: StartingDayOfWeek.monday,
//             calendarStyle: const CalendarStyle(
//               // Use `CalendarStyle` to customize the UI
//               outsideDaysVisible: false,
//             ),
//             onDaySelected: _onDaySelected,
//             // onRangeSelected: _onRangeSelected,
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//           ),
//           const SizedBox(height: 8.0),
//           Expanded(
//             child: ValueListenableBuilder<List<DreamEntity>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 4.0,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: ListTile(
//                         onTap: () => print('${value[index]}'),
//                         title: Text(value[index].description),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

// /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }

// /////////////////////////////////-*------------------------------------------////

// List<DreamEntity> _dreamEntities = List.generate(20, (index) {
//   DateTime randomDate =
//       DateTime.now().subtract(Duration(days: Random().nextInt(30)));
//   List<String> sampleTypes = ['Lucid', 'Nightmare', 'Adventure'];
//   List<String> sampleEmotions = ['Happy', 'Scared', 'Excited'];
//   List<String> samplePeople = ['Friend', 'Family', 'Stranger'];
//   List<String> samplePlaces = ['Forest', 'City', 'Beach'];
//   List<String> sampleTags = ['Fantasy', 'Reality', 'Mystery'];

//   return DreamEntity(
//     clarity: Random().nextDouble() * 100,
//     date: randomDate,
//     description: 'Dream description $index',
//     dreamTypes: [sampleTypes[Random().nextInt(sampleTypes.length)]],
//     emotions: [sampleEmotions[Random().nextInt(sampleEmotions.length)]],
//     id: 'dream_$index',
//     people: [samplePeople[Random().nextInt(samplePeople.length)]],
//     places: [samplePlaces[Random().nextInt(samplePlaces.length)]],
//     tags: [sampleTags[Random().nextInt(sampleTags.length)]],
//     title: 'Dream $index',
//   );
// });

// List<DreamEntity> dreamEntities = [
//   DreamEntity(
//     clarity: 75.0,
//     date: DateTime.now(),
//     description: 'A fascinating dream about flying',
//     dreamTypes: ['Lucid'],
//     emotions: ['Excited'],
//     id: 'dream_1',
//     people: ['Friend'],
//     places: ['Sky'],
//     tags: ['Adventure'],
//     title: 'Flying High',
//   ),
//   DreamEntity(
//     clarity: 75.0,
//     date: DateTime(2023, 12, 10),
//     description: 'A fascinating dream about flying',
//     dreamTypes: ['Lucid'],
//     emotions: ['Excited'],
//     id: 'dream_1',
//     people: ['Friend'],
//     places: ['Sky'],
//     tags: ['Adventure'],
//     title: 'Flying High',
//   ),
//   DreamEntity(
//     clarity: 60.0,
//     date: DateTime(2023, 12, 5),
//     description: 'Nightmare with mysterious creatures',
//     dreamTypes: ['Nightmare'],
//     emotions: ['Scared'],
//     id: 'dream_2',
//     people: ['Unknown'],
//     places: ['Dark Forest'],
//     tags: ['Horror'],
//     title: 'Creepy Encounter',
//   ),
//   // ... Agrega aquí las otras 8 instancias de DreamEntity ...
//   DreamEntity(
//     clarity: 90.0,
//     date: DateTime(2023, 11, 28),
//     description: 'Joyful dream with friends and laughter',
//     dreamTypes: ['Adventure'],
//     emotions: ['Happy'],
//     id: 'dream_10',
//     people: ['Friends'],
//     places: ['Amusement Park'],
//     tags: ['Fun'],
//     title: 'Memorable Moments',
//   ),
// ];
