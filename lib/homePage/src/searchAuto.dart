import 'package:covafrik/provider/countriesProv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchAuto extends StatelessWidget {
  const SearchAuto({
    Key key,
    @required this.country,
  }) : super(key: key);

  final CountriesProv country;

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
            hintText: country.current,
          ),
        ),
        suggestionsCallback: (enteredText) => country.countries.where((item) {
          if (enteredText.length < 1) return false;
          return item.toLowerCase().contains(enteredText.toLowerCase());
        }),
        itemBuilder: (_, String country) => ListTile(
          title: Text(country),
        ),
        onSuggestionSelected: (String value) {
          country.changeCurrent(value);
          country.callLoadingScreen();
          //call the load screen and getData function
        },
        loadingBuilder: (_) => ListTile(
          title: Text("Enter a West Africa Country"),
        ),
      ),
    );
  }
}
