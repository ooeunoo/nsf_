DateTime getTodayDateTime() {
  DateTime now = DateTime.now();
  DateTime dateOnly = DateTime(now.year, now.month, now.day);
  print(dateOnly);
  return dateOnly;
}

int minuteToSecond(int minutes) {
  print('minutes: $minutes');
  return minutes * 60;
}

String secondToMinute(int sec) {
  return (sec / 60).toStringAsFixed(0);
}
