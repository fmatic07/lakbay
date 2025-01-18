import 'dart:math';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    // Try to enable location services
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    serviceEnabled = await Geolocator.openLocationSettings();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
  }

  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permission is denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot proceed.');
  }

  return await Geolocator.getCurrentPosition();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late double lat = 0.0;
  late double long = 0.0;
  late GoogleMapController mapController;

  late LatLng _center = const LatLng(14.6217393, 120.9761594);
  final String currentLocation = 'Your current location';

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void setCurrentLocation() {
    developer.log('Building current location...');
    getCurrentLocation().then((value) {
      lat = value.latitude;
      long = value.longitude;

      setState(() {
        _center = LatLng(lat, long);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    setCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(currentLocation),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Implement back button functionality here
              // For example:
              Navigator.pop(context);
            },
          ),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('Manila'),
              position: _center,
            ),
          },
        ),
      ),
    );
  }
}
