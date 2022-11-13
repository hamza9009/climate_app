import 'package:geolocator/geolocator.dart';
class Location{
  double magnitude;
  double latitude;

  Future<void> getLocation()async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      //print(position);
      magnitude = position.longitude;
      latitude=position.latitude;
      print(magnitude);
    }
    catch(e){
      print(e);

    }
  }
}