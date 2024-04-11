DateTime getTodayDateTime() {
  DateTime now = DateTime.now();
  DateTime dateOnly = DateTime(now.year, now.month, now.day);
  return dateOnly;
}

int convertMinToSec(String min) {
  return int.parse(min) * 60;
}

String convertSecToMin(int sec) {
  return (sec / 60).toStringAsFixed(0);
}
