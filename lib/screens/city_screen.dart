import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                  constraints: BoxConstraints(minWidth: 70, minHeight: 70),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  style: kTextFillTextStyle,
                  decoration: kTextFillInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
