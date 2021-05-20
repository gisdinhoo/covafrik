import 'package:covafrik/models/countryModel.dart';
import 'package:covafrik/models/statsModel.dart';
import 'package:covafrik/services/statsService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//BuildContext to provide data
BuildContext _mainContext;

class BaseController with ChangeNotifier {
  // Models
  StatsModel currentData = _mainContext.read<StatsModel>();
  CountryModel countryModel = _mainContext.read<CountryModel>();

  // Services
  StatsService serviceCom = _mainContext.read<StatsService>();

  static void init(BuildContext context) {
    _mainContext = context;
  }
}
