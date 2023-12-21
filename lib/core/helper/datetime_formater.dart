import 'package:intl/intl.dart';

import '../../l10n/string_hardcoded.dart';

class DateFormatter {
  static format(DateTime date, {String? format}) {
    return DateFormat(format).format(date);
  }

  static String fullDate(DateTime date) {
    return format(date, format: 'yMMMMEEEEd');
  }

  static String shortDate(DateTime date) {
    return format(date, format: 'yMMMd');
  }

  static String fullTime(DateTime time) {
    return format(time, format: 'HH:mm');
  }

  static String shortTime(DateTime time) {
    return format(time, format: 'hh:mm a');
  }

  static String onlyMonth(DateTime date) {
    return format(date, format: 'MMMM');
  }

  static String monthAndYear(DateTime date) {
    return format(date, format: 'yMMMM');
  }

  static String onlyDay(DateTime date) {
    return format(date, format: 'EEEE');
  }

  static String modularDay(DateTime dateTime) {
    DateTime now = DateTime.now();
    if (isSameWeek(dateTime, now)) {
      return onlyDay(dateTime);
    } else {
      return shortDate(dateTime);
    }
  }

  static String modularMonth(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year
        ? DateFormatter.onlyMonth(date).capitalize()
        : DateFormatter.monthAndYear(date).capitalize();
  }

  static bool isSameWeek(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.weekOfYear == date2.weekOfYear;
  }
}

extension WeekOfYear on DateTime {
  int get weekOfYear {
    final startOfYear = DateTime(year, 1, 1);
    final firstMonday = startOfYear.weekday;
    final daysBeforeFirstMonday =
        firstMonday <= 4 ? firstMonday - 1 : 8 - firstMonday;
    final currentDay = DateTime(year, month, day);
    final passedDays = currentDay.difference(startOfYear).inDays;
    return (passedDays - daysBeforeFirstMonday) ~/ 7 + 1;
  }
}
