import 'dart:developer';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position> getMyCurrentLocation() async {
    LocationPermission permission;
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    log(" isServiceEnabled : ${isServiceEnabled}");
    if (!isServiceEnabled) {
      await Geolocator.requestPermission();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(position);

    // return await Geolocator.getCurrentPosition(
    // desiredAccuracy: LocationAccuracy.high,
    // );

    return position;
  }
}