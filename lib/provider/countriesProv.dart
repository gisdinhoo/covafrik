import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountriesProv with ChangeNotifier {
  List<String> countries = [
    "Benin",
    "Burkina-Faso",
    "Cabo-Verde",
    "Ivory-Coast",
    "Gambia",
    "Ghana",
    "Guinea",
    "Guinea-Bissau",
    "Liberia",
    "Mali",
    "Mauritania",
    "Niger",
    "Nigeria",
    "Senegal",
    "Sierra-Leone",
    "Togo",
  ];
  //Variables
  //Variables
  String current = "Senegal";
  List<String> currentData;
  bool load =
      true; // when is true, we're gonna call the Load widget wich will call geData function

  void changeCurrent(String value) {
    current = value;
  }

  void callLoadingScreen() {
    load = true;
    notifyListeners();
  }

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

  Future<void> getData(String country) async {
    load = true;
    var myUrl = Uri.parse(
        "https://covid-193.p.rapidapi.com/statistics?country=$country");
    Map<String, String> myHeaders = {
      "X-RapidAPI-Host": "covid-193.p.rapidapi.com",
      "X-RapidAPI-Key": "1d7673377bmshc39fd35abe0138dp157158jsnb68edb466f11"
    };
    http.Response response = await http.get(myUrl, headers: myHeaders);
    var data = jsonDecode(response.body);
    data = data["response"][0];
    print(jsonDecode(response.body));
    print(data);

    Map cases = data["cases"];
    Map deaths = data["deaths"];

    var newCases = cases["new"];
    var active = cases["active"];
    var newDeaths = deaths["new"];
    var day = data["day"];
    if (newDeaths == null) {
      newDeaths = "0";
    }
    if (newCases == null) {
      newCases = "0";
    }
    if (active == null) {
      active = "0";
    }
    day = dateParse(DateTime.parse(day)) +
        " " +
        (DateTime.parse(day).day).toString();
    currentData = [
      newCases.toString(),
      active.toString(),
      newDeaths.toString(),
      day,
    ];
    load = false;
    notifyListeners();
  }
}
