class DateHelp {

  static Map<String, int> currentDate() {

    final date = DateTime.now();

    final day = date.day;
    final month = date.month;
    final year = date.year;

    return {
      'day': day,
      'month': month,
      'year': year,
    };

  }

}