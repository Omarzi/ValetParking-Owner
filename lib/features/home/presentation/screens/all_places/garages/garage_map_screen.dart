import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart'; // Geolocator for current location

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
  LatLng _selectedLocation = LatLng(37.7749, -122.4194); // Default location (San Francisco)
  bool _loading = true; // To handle loading while fetching location

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Function to check permissions and get current location
  Future<void> _getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;  // Location services are not enabled, do not proceed
    }

    // Request location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return;  // Permissions are permanently denied, return early
      }
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Update the map position and stop loading
    setState(() {
      _selectedLocation = LatLng(position.latitude, position.longitude);
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator()) // Show a loader while fetching location
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _selectedLocation,
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        onTap: (LatLng location) {
          setState(() {
            _selectedLocation = location;
          });
        },
        markers: {
          Marker(
            markerId: MarkerId('selected-location'),
            position: _selectedLocation,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, _selectedLocation); // Return the selected location
        },
        child: Icon(Icons.check),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class GoogleMapScreen extends StatefulWidget {
//   @override
//   _GoogleMapScreenState createState() => _GoogleMapScreenState();
// }
//
// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   late GoogleMapController mapController;
//   LatLng _selectedLocation = LatLng(30.176387212484354, 31.53834391306019); // Default location (San Francisco)
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Location'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: _selectedLocation,
//           zoom: 14,
//         ),
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         onTap: (LatLng location) {
//           setState(() {
//             _selectedLocation = location;
//           });
//         },
//         markers: {
//           Marker( // Directly use Marker without any prefix
//             markerId: MarkerId('selected-location'),
//             position: _selectedLocation,
//           ),
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pop(context, _selectedLocation);
//         },
//         child: Icon(Icons.check),
//       ),
//     );
//   }
// }
//
