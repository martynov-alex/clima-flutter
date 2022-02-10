import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFillInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Align(
    widthFactor: 1.5,
    heightFactor: 1.5,
    child: Icon(
      Icons.location_city,
      size: 40,
      color: Colors.black,
    ),
  ),
  hintText: 'Enter city name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);

const kTextFillTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
  color: Colors.black,
);
