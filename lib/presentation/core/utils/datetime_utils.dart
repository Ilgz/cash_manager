import 'package:cash_manager/presentation/core/constants.dart';

String getWeekday(DateTime date) {
  return weekDays[date.weekday - 1].toUpperCase();
}
String getDay(DateTime date) {
  return date.day.toString();
}