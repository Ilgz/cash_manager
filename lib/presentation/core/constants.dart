import 'package:flutter/material.dart';

class PageRoutes{
  static const transactionPage="/transaction";
  static const detailPage="detailPage";
  static const profilePage="profile_page";
}
class AppColorConstants{
  static const lightScaffoldBackgroundColor=Colors.white;
  static const darkScaffoldBackgroundColor=Color(0xFF1C7549);
  static const lightPrimaryColor=Color(0xff74D25D);
  static const darkPrimaryColor=Colors.green;
}
class AppConstants{
  static const myServer="127.0.0.1:8000";
  static const fcmServer="https://fcm.googleapis.com/fcm/send";
  static const fcmApiToken="AAAAE0e1ZXU:APA91bEBCR6NqGsX2J7pVZO4mQW8x6kYHL5GragMbBmjIdXtxQ6d5xqdiQUzJ8Ho5eu_1-YIZUpzS7yH9_qHnXmJUWOrmK96SJBqq0xpBpm5nO-4pNjpaISKgzk7luYzYYttnCcg6qN6";
  static const isDark="is_dark";
  static const locale="locale";
}
final List<String> weekDays = [
  "mon",
  "tue",
  "wed",
  "thu",
  "fri",
  "sat",
  "sun",
];
final List<String> months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];