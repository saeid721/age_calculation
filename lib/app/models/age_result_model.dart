


class AgeResultModel {
  final int years, months, days, hours, minutes, seconds;
  AgeResultModel({
    required this.years,
    required this.months,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  int get totalMonths => years * 12 + months;
  int get totalDays => ((years * 365) + (months * 30) + days); // approximate
  int get totalHours => totalDays * 24 + hours;
  int get totalMinutes => totalHours * 60 + minutes;
  int get totalSeconds => totalMinutes * 60 + seconds;
}
