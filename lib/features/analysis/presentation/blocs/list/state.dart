part of 'bloc.dart';

abstract class State extends Equatable {
  final Model model;
  const State(this.model);

  @override
  List<Object> get props => [];
}

class InitialState extends State {
  const InitialState(super.model);
}

class LoadingState extends State {
  const LoadingState(super.model);
}

class DreamsLoaded extends State {
  const DreamsLoaded(super.model);
}

class ErrorState extends State {
  const ErrorState(super.model);
}

class Model extends Equatable {
  final List<DreamEntity> dreams;
  final String error;
  const Model({
    this.dreams = const [],
    this.error = '',
  });

  List<OrdinalData> getData({SelectType? type}) {
    Map<String, double> map = {};

    void processDreamItems(List<String> items) {
      for (final item in items) {
        map.update(item.cut(18), (value) => value + 1, ifAbsent: () => 1);
      }
    }

    switch (type) {
      case SelectType.emotion:
        for (final dream in dreams) {
          processDreamItems(dream.emotions);
        }
        break;
      case SelectType.people:
        for (final dream in dreams) {
          processDreamItems(dream.people);
        }
        break;
      case SelectType.places:
        for (final dream in dreams) {
          processDreamItems(dream.places);
        }
        break;
      case SelectType.tags:
        for (final dream in dreams) {
          processDreamItems(dream.tags);
        }
        break;
      default:
        for (final dream in dreams) {
          processDreamItems(dream.dreamTypes);
        }
    }

    return OrdinalDataModel.toList(map);
  }

  DateModel getDates() {
    final dates = dreams.map((e) => e.date).toList();
    Map<DateTime, int> datesMap = {};

    for (final date in dates) {
      DateTime fechaSinHora = DateTime(date.year, date.month, date.day);
      datesMap.update(fechaSinHora, (value) => value + 1, ifAbsent: () => 1);
    }

    List<DateTime> sortedDates = datesMap.keys.toList()
      ..sort((a, b) => a.compareTo(b));
    DateTime oldestDate = sortedDates.first;

    return DateModel(
      datesMap: datesMap,
      oldestDate: oldestDate,
    );
  }

  int countWords() {
    return dreams.fold(
      0,
      (t, e) => t + e.description.split(' ').length,
    );
  }

  List<OrdinalData> getDreamTypes() {
    List<DreamType> allDreams = [];
    for (var dream in dreams) {
      final types =
          dream.dreamTypes.map((e) => DreamType.getDreamType(e)).toList();
      allDreams.addAll(types);
    }

    Map<DreamType, double> counts = {};

    for (var type in allDreams) {
      counts[type] = (counts[type] ?? 0) + 1;
    }

    double totalDreams = allDreams.length.toDouble();

    Map<DreamType, double> percentages = {};

    counts.forEach((type, count) {
      double percentage = ((count / totalDreams) * 100);
      percentages[type] = percentage;
    });

    List<OrdinalData> data = [];

    percentages.forEach((type, percentage) {
      data.add(OrdinalDataModel(
        domain: type.name,
        measure: percentage.toInt(),
        color: type.color,
      ));
    });

    return data;
  }

  @override
  List<Object?> get props => [dreams, error];

  Model copyWith({
    List<DreamEntity>? dreams,
    String? error,
  }) {
    return Model(
      dreams: dreams ?? this.dreams,
      error: error ?? this.error,
    );
  }
}

class DateModel {
  final Map<DateTime, int> datesMap;
  final DateTime oldestDate;

  DateModel({
    required this.datesMap,
    required this.oldestDate,
  });
}
