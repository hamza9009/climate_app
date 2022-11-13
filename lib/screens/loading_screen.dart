import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double magnitude;
  void initState() {
    super.initState();
    gettlocation();
    // getData();
  }

  void gettlocation() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherdata = await weatherModel.gettlocation();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather : weatherdata,);
    }),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}