class DateTimeHelper {
  static final date = DateTime.now();

  static get day {
    String day = date.day.toString();

    day.length == 1 ? day = '0' + day : day;

    return day;
  }

  static get month {
    String month = date.month.toString();

    month.length == 1 ? month = '0' + month : month;

    return month;
  }

  static get year {
    return date.year.toString();
  }

  static get hour {
    String hour = date.hour.toString();

    hour.length == 1 ? hour = '0' + hour : hour;

    return hour;
  }

  static get minute {
    String minute = date.minute.toString();

    minute.length == 1 ? minute = '0' + minute : minute;

    return minute;
  }

  static get second {
    String second = date.second.toString();

    second.length == 1 ? second = '0' + second : second;

    return second;
  }
}
