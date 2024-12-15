import 'package:flutter/material.dart';
import 'package:wheater/screens/city_screen.dart';
import 'package:wheater/services/weather.dart';
import 'package:wheater/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.weatherData});

  final weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temp;
  late String cityName;
  late String weatherIcon;
  late String message;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic locationWeather) {
    setState(() {
      if(locationWeather == null){
        this.temp = 0;
        message = "Something are wrong!";
        weatherIcon = weather.getWeatherIcon(0);
        cityName ="";
        return;
      }
      double temp = locationWeather['main']['temp'] - 273;
      this.temp = temp.toInt();
      message = weather.getMessage(this.temp);
      int condition = locationWeather['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = locationWeather['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
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
                  GestureDetector(
                    onTap: () async{
                      var currentLocation = await weather.getLocationData();
                      updateUI(currentLocation);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      var typedCity  = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                      var cityData = await weather.getCityData(typedCity);

                      if(typedCity != null){
                      updateUI(cityData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temp.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
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
