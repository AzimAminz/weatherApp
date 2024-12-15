import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wheater/screens/location_screen.dart';
import 'package:wheater/services/weather.dart';

const apiKey = 'fdeedabbf67e2da7eb0e95b7ce8a6479';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

 

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }


  Future<void> getLocation() async {
    
    var weatherData = await WeatherModel().getLocationData();

    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(weatherData: weatherData,)));
  }

  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
        ),
      ),
    );
  }
}
