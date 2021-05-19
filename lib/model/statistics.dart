class Statistics {
  String newCases, active, newDeaths, day;
  String country = "Senegal";
  bool load = true;
  Statistics({this.newCases, this.active, this.newDeaths, this.day});

  String dateParse(DateTime date) {
    switch (date.month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Unknown";
    }
  }

  Statistics.fromJson(Map<String, dynamic> resp) {
    Map<String, dynamic> cases = resp["cases"];
    Map<String, dynamic> deaths = resp["deaths"];

    newCases = cases["new"] ??= "0";
    active = cases["active"].toString();
    newDeaths = deaths["new"] ??= "0";
    day = dateParse(DateTime.parse(resp["day"])) +
        " " +
        (DateTime.parse(resp["day"]).day).toString();
  }
}
