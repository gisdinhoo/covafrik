import 'package:flutter/cupertino.dart';

class CountryModel with ChangeNotifier {
  String _currentCountry = "Senegal";
  List<String> _countries = [
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

  CountryModel();

  void setCurrentCountry(String value) {
    _currentCountry = value;
    notifyListeners();
  }

  String getCurrentCountry() {
    return _currentCountry;
  }

  List<String> getCountries() {
    return _countries;
  }
}
