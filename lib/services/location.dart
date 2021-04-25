import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<bool> getCurrentLocation() async {
    try {
      Position pos = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = pos.latitude;
      longitude = pos.longitude;
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
