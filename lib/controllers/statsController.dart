import 'package:covafrik/controllers/baseController.dart';


class StatsController  extends BaseController {

  void changeCurrent(String value) {
    countryModel.setCurrentCountry(value);
  }
  String getCurrentCountry() {
    return countryModel.getCurrentCountry();
  }

  List<String> getCountries() {
    return countryModel.getCountries();
  }

  void callLoadingScreen() {
    currentData.setLoad();
  }

  Future<void> getStats(String country) async {
    Map<String, dynamic> resp = await serviceCom.getStatService(country);
    currentData.setAttributes(resp);
    currentData.load = false;
  }
}