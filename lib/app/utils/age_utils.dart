import 'package:flutter/foundation.dart';

class AgeResult {
  final int years;
  final int months;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  AgeResult({
    required this.years,
    required this.months,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  String toString() {
    return '$years years, $months months, $days days, $hours hours, $minutes minutes, $seconds seconds';
  }
}

/// Compute age by stepping months/years to handle variable month lengths.
///
/// dob and now should be in same timezone (DateTime with offset).
AgeResult computeAge(DateTime dob, DateTime now) {
  assert(!dob.isAfter(now), 'DOB must not be in the future');

  int years = now.year - dob.year;
  int months = now.month - dob.month;
  int days = now.day - dob.day;
  int hours = now.hour - dob.hour;
  int minutes = now.minute - dob.minute;
  int seconds = now.second - dob.second;

  if (seconds < 0) {
    seconds += 60;
    minutes -= 1;
  }
  if (minutes < 0) {
    minutes += 60;
    hours -= 1;
  }
  if (hours < 0) {
    hours += 24;
    days -= 1;
  }
  if (days < 0) {
    final prevMonth = DateTime(now.year, now.month, 0);
    days += prevMonth.day;
    months -= 1;
  }
  if (months < 0) {
    months += 12;
    years -= 1;
  }
  if (years < 0) {
    // Should not happen due to assert; fallback
    years = 0;
  }

  return AgeResult(
    years: years,
    months: months,
    days: days,
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  );
}
