import 'package:geolocator/geolocator.dart';
import 'package:wheater/services/location.dart';
import 'package:wheater/services/networking.dart';

const apiKey = "b6907d289e10d714a6e88b30761fae22";
const openWeatherURL = "https://samples.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityData(String city) async {
    //Must using api city's url but idont have it
    NetworkHelper locationWeather =
        NetworkHelper('${openWeatherURL}?lat=35&lon=139&appid=${apiKey}');

    var weatherData = await locationWeather.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    Position position;

    await location.determinePermisson();
    position = await location.getCurrentLocation();

    NetworkHelper locationWeather =
        NetworkHelper('${openWeatherURL}?lat=35&lon=139&appid=${apiKey}');

    var weatherData = await locationWeather.getData();
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
