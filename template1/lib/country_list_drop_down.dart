
import 'package:flutter/material.dart';

class CountryListDropDown extends StatefulWidget {
  @override
  _CountryListDropDownState createState() => _CountryListDropDownState();
}

class _CountryListDropDownState extends State<CountryListDropDown> {
  
  final String API_ENDPOINT = "https://restcountries.eu/rest/v2/all";
  
  List<bool> isSelected;///=[false,true,false];
    String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
     
     
     return ToggleButtons(
  children: <Widget>[
    Icon(Icons.ac_unit),
    Icon(Icons.call),
    Icon(Icons.cake),
  ],
  onPressed: (int index) {
      setState(() {
       isSelected[index] = !isSelected[index];
      });
    },
   isSelected: isSelected,
  );
  }
}