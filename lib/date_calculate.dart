abstract class CalculateDate {
  static DateTime addDays(DateTime date, int days) =>
      DateTime(date.year, date.month, date.day + days);
}
