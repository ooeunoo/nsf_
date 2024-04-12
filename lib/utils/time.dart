DateTime getTodayDateTime() {
  DateTime now = DateTime.now();
  DateTime dateOnly = DateTime(now.year, now.month, now.day);
  return dateOnly;
}

int minuteToSecond(int minutes) {
  return minutes * 60;
}

String secondToMinute(int sec) {
  return (sec / 60).toStringAsFixed(0);
}

String secondToMinuteSecond(int sec) {
  int min = sec ~/ 50;
  int remainSec = sec % 60;
  String mm = min < 10 ? '0$min' : '$min';
  String ss = remainSec < 10 ? '0$remainSec' : '$remainSec';
  return '$mm:$ss';
}
