import 'dart:async';
import 'package:get/get.dart';
import '../models/age_model.dart';

class AgeController extends GetxController {
  DateTime currentDate = DateTime.now();
  DateTime dateOfBirth = DateTime(1993, 10, 20);

  AgeModel? age;
  bool showResult = false;

  Timer? _timer;

  void setCurrentDate(DateTime date) {
    currentDate = date;
    update();
  }

  void setDob(DateTime date) {
    dateOfBirth = date;
    update();
  }

  void calculateAge() {
    final now = currentDate;
    final birth = dateOfBirth;

    if (birth.isAfter(now)) {
      age = null;
      showResult = true;
      update();
      return;
    }

    int years = now.year - birth.year;
    int months = now.month - birth.month;
    int days = now.day - birth.day;
    int hours = now.hour - birth.hour;
    int minutes = now.minute - birth.minute;
    int seconds = now.second - birth.second;

    if (seconds < 0) {
      seconds += 60;
      minutes--;
    }
    if (minutes < 0) {
      minutes += 60;
      hours--;
    }
    if (hours < 0) {
      hours += 24;
      days--;
    }
    if (days < 0) {
      months--;
      days += DateTime(now.year, now.month, 0).day;
    }
    if (months < 0) {
      years--;
      months += 12;
    }

    final totalDays = now.difference(birth).inDays;
    final totalHours = now.difference(birth).inHours;
    final totalMinutes = now.difference(birth).inMinutes;
    final totalSeconds = now.difference(birth).inSeconds;
    final totalMonths = years * 12 + months;

    age = AgeModel(
      years: years,
      months: months,
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      totalMonths: totalMonths,
      totalDays: totalDays,
      totalHours: totalHours,
      totalMinutes: totalMinutes,
      totalSeconds: totalSeconds,
    );

    showResult = true;
    _startLiveTick();
    update();
  }

  void _startLiveTick() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      currentDate = DateTime.now();
      if (showResult) calculateAge();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
