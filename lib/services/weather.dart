import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/get_country_name.dart';
import 'package:flutter/cupertino.dart';

const apiKey = '4d97e3c9526feb93f8d3a07212dafe1e';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    // Получаем данные по текущей геопозиции (координаты)
    // Создаем объект класса Location из location.dart
    Location location = Location();

    // Запускаем метод getCurrentLocation() для определения и записи координат
    // в соотвествующие параметры объекта
    await location.getCurrentLocation();

    // Получаем данные о погоде по координатам
    // Создаем объект класса NetworkHelper из networking.dart
    // Передаем координаты и необходимые параметры сервису OneWeatherMap в
    // формате URL запроса
    var url =
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);

    // Запускаем метод getData() для получения данных от сервиса в виде JSON
    // строки, которая парсится в словарь и возвращается
    var weatherData = await networkHelper.getData();

    // Переводим полученный от OneWeatherMap код страны по ISO 3166-1 alpha-2
    // в полное англоязычное название
    // Создаем объект класса CountryProviderService из get_country_name.dart
    CountryProviderService countryProviderService = CountryProviderService();

    // Запускаем метод getCountryName() для плучения от сервиса данных о
    // стране по коду страны, результат - объект класса Country
    var country = await countryProviderService.getCountryName(
        countryCode: weatherData['sys']['country']);

    // Имя страны хранится в параметре name объекта
    weatherData['countryFullName'] = country.name;

    // Имя страны хранится в параметре name объекта
    //String countryName = country.name;

    return weatherData;
  }

  // Аналогичный метод, но передается название города, который указал пользователь
  Future<dynamic> getCityWeather({String cityName = ''}) async {
    var url = '$openWeatherMapURL?q=$cityName&units=metric&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    CountryProviderService countryProviderService = CountryProviderService();
    var country = await countryProviderService.getCountryName(
        countryCode: weatherData['sys']['country']);
    weatherData['countryFullName'] = country.name;
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
