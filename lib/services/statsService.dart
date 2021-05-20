import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class StatsService with ChangeNotifier{
  Future<Map<String, dynamic>> getStatService(String country) async {
    var myUrl = Uri.parse(
        "https://covid-193.p.rapidapi.com/statistics?country=$country");
    Map<String, String> myHeaders = {
      "X-RapidAPI-Host": "covid-193.p.rapidapi.com",
      "X-RapidAPI-Key": "1d7673377bmshc39fd35abe0138dp157158jsnb68edb466f11"
    };
    http.Response response = await http.get(myUrl, headers: myHeaders);
    Map<String, dynamic> resp = (jsonDecode(response.body))["response"][0];
    return resp;
  }
}