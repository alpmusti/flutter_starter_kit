import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  String toDateString({String format = 'dd.MM.yyyy'}) {
    return DateFormat(format).format(this);
  }
}
