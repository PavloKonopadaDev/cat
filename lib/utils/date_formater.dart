import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime dateTime) {
    final formatter = DateFormat.yMd().add_jm();
    return formatter.format(dateTime);
  }
}
