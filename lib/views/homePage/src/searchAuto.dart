import 'package:covafrik/controllers/statsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchAuto extends StatelessWidget {
  const SearchAuto({
    Key key,
    @required this.statsController,
  }) : super(key: key);

  final StatsController statsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: TypeAheadField(
        hideOnEmpty: true,
        hideOnLoading: true,
        textFieldConfiguration: TextFieldConfiguration(
          cursorColor: Color(0xffebcfba),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xffebcfba),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                )),
            hintText: statsController.getCurrentCountry(),
          ),
        ),
        suggestionsCallback: (enteredText) => statsController.getCountries().where((item) {
          if (enteredText.length < 1) return false;
          return item.toLowerCase().contains(enteredText.toLowerCase());
        }),
        itemBuilder: (_, String country) => ListTile(
          title: Text(country),
        ),
        onSuggestionSelected: (String value) {
          statsController.changeCurrent(value);
          statsController.callLoadingScreen();
          //call the load screen and getData function
        },
        loadingBuilder: (_) => ListTile(
          title: Text("Enter a West Africa Country"),
        ),
      ),
    );
  }
}
