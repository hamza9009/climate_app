import 'dart:convert';
import 'package:http/http.dart' as http;
import 'location.dart';
class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    Location location =  Location();
    await location.getLocation();
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.magnitude}&appid=72083a3a03072e69f5017506193ba12e"));
    // print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedata = jsonDecode(data);
      return decodedata;
    }
    else {
      print(response.statusCode);
    }
  }



    }