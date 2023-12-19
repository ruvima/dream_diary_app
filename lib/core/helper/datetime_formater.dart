import 'package:intl/intl.dart';

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
}
