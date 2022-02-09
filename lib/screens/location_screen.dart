import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/services/get_country_name.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather, required this.country});

  final locationWeather;
  String country;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int condition = 0;
  int temperature = 0;
  String cityName = '';
  String countryName = '';
  String countryCode = '';
  String weatherIcon = '';
  String weatherMessage = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather, widget.country);
  }

  void updateUI(dynamic weatherData, String country) {
    condition = weatherData['weather'][0]['id'];
    temperature = weatherData['main']['temp'].round();
    cityName = weatherData['name'];
    countryName = country;
    countryCode = weatherData['sys']['country'];
    weatherIcon = weather.getWeatherIcon(condition);
    weatherMessage = weather.getMessage(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.near_me),
                    iconSize: 50,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_city),
                    iconSize: 50,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text('$temperature°', style: kTempTextStyle),
                    Text(weatherIcon, style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName ($countryName)',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
