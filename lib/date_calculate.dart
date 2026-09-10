abstract class CalculateDate {
  static DateTime addDays(DateTime date, int days) =>
      DateTime(date.year, date.month, date.day + days);

  static const Map<String, String> festeFeiertage = {
    "1-1": "Neujahr",
    "5-1": "Tag der Arbeit",
    "10-3": "Tag der Deutschen Einheit",
    "12-25": "1. Weihnachtstag",
    "12-26": "2. Weihnachtstag",
  };

  static bool isFeierTag(DateTime month, DateTime day) {
    String key = '${month.month}-${day.day}';
    return festeFeiertage.containsKey(key);
  }

  static int numberOfDay(DateTime day) {
    return day.day;
  }
}
