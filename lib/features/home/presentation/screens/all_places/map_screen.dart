import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:valetparking_owner/utils/language/app_localizations.dart';
// import 'package:valetparking_owner/utils/constants/exports.dart';

class MapScreen extends StatefulWidget {
  final double initialLat;
  final double initialLng;

  const MapScreen({Key? key, required this.initialLat, required this.initialLng})
      : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('chooseLocation')!),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLat, widget.initialLng),
          zoom: 14.0,
        ),
        onTap: (LatLng location) {
          setState(() {
            selectedLocation = location;
          });
        },
        markers: selectedLocation != null
            ? {
          Marker(
            markerId: MarkerId('selected-location'),
            position: selectedLocation!,
          ),
        }
            : {},
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          if (selectedLocation != null) {
            Navigator.pop(
                context, {'lat': selectedLocation!.latitude, 'lng': selectedLocation!.longitude});
          } else {
            // Handle case where no location was selected
          }
        },
      ),
    );
  }
}
