import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const kAPIkey = '6598e125ef69710dbc8b44955879129c';
const kOpenWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeather(String url) async {
    return await NetworkHelper(url).getData();
  }

  dynamic getCityWeather(String city) {
    var url = '$kOpenWeatherMapURL?q=$city&appid=$kAPIkey&units=imperial';
    return getWeather(url);
  }

  Future<dynamic> getLocationWeather() async {
    var location = Location();
    await location.getCurrentLocation();

    var url =
        '$kOpenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kAPIkey&units=imperial';

    return getWeather(url);
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
    if (temp > 85) {
      return 'It\'s 🍦 time';
    } else if (temp > 70) {
      return 'Time for shorts and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
