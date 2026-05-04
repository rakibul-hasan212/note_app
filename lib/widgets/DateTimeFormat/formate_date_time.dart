import 'package:intl/intl.dart';

// 🔥 Date format function
String formatDateTime(DateTime? dateTime) {

  if (dateTime == null) return "";

  final now = DateTime.now();

  // 🔥 check today
  if (dateTime.day == now.day &&
      dateTime.month == now.month &&
      dateTime.year == now.year) {

    return "Today, ${DateFormat.jm().format(dateTime)}";
  }

  // 🔥 check yesterday
  final yesterday = now.subtract(Duration(days: 1));

  if (dateTime.day == yesterday.day &&
      dateTime.month == yesterday.month &&
      dateTime.year == yesterday.year) {

    return "Yesterday, ${DateFormat.jm().format(dateTime)}";
  }

  // 🔥 default full date
  return DateFormat('d MMM y, jm').format(dateTime);
}