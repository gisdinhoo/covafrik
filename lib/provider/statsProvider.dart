import 'dart:convert';

import 'package:covafrik/model/statistics.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class StatsProvider with ChangeNotifier {
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

  Statistics currentData = Statistics();

  void changeCurrent(String value) {
    currentData.country = value;
  }

  void callLoadingScreen() {
    currentData.load = true;
    notifyListeners();
  }

  Future<void> getStats(String country) async {
    var myUrl = Uri.parse(
        "https://covid-193.p.rapidapi.com/statistics?country=$country");
    Map<String, String> myHeaders = {
      "X-RapidAPI-Host": "covid-193.p.rapidapi.com",
      "X-RapidAPI-Key": "1d7673377bmshc39fd35abe0138dp157158jsnb68edb466f11"
    };
    http.Response response = await http.get(myUrl, headers: myHeaders);
    Map<String, dynamic> resp = (jsonDecode(response.body))["response"][0];
    //print((resp));
    currentData = Statistics.fromJson(resp);
    currentData.load = false;
    notifyListeners();
  }
}
