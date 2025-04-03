bool isToday(DateTime date) =>
    date.year == DateTime.now().year &&
    date.month == DateTime.now().month &&
    date.day == DateTime.now().day;


DateTime nextMonday() {
  final DateTime currentDate = DateTime.now();
  int daysUntilNextMonday = DateTime.monday - currentDate.weekday;
  if (daysUntilNextMonday <= 0) {
    daysUntilNextMonday += 7;
  }
  return currentDate.add(Duration(days: daysUntilNextMonday));
}

DateTime nextTuesday() {
  final DateTime currentDate = DateTime.now();
  int daysUntilNextTuesday = DateTime.tuesday - currentDate.weekday;
  if (daysUntilNextTuesday <= 0) {
    daysUntilNextTuesday += 7;
  }
  return currentDate.add(Duration(days: daysUntilNextTuesday));
}

DateTime afterOneWeek() => DateTime.now().add(const Duration(days: 7));