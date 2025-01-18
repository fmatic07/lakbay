import 'package:flutter/material.dart';
import 'package:lakbay/widgets/custom_bottom_nav_bar.dart';
import 'package:lakbay/widgets/ImageGrid.dart';
import 'package:lakbay/widgets/DateSelectorRow.dart';
import 'package:lakbay/widgets/CustomSearchbar.dart';
import 'package:lakbay/widgets/location_list_page.dart';

import '../model/Location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Future<Position> getCurrentLocation() async {
//   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//
//   if (!serviceEnabled) {
//     // Try to enable location services
//     LocationSettings locationSettings = const LocationSettings(
//       accuracy: LocationAccuracy.high,
//       distanceFilter: 100,
//     );
//
//     serviceEnabled = await Geolocator.openLocationSettings();
//
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//   }
//
//   LocationPermission permission = await Geolocator.checkPermission();
//
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permission is denied');
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot proceed.');
//   }
//
//   return await Geolocator.getCurrentPosition();
// }

// Future<void> openMap(String lat, String long) async {
//   String googleMapURL =
//       'https://www.google.com/maps/search/?api=1&query=$lat,$long';
//
//   await canLaunchUrlString(googleMapURL)
//       ? await launchUrlString(googleMapURL)
//       : throw 'Could not launch $googleMapURL';
// }

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  late String lat;
  late String long;

  String locationMessage = 'Current Location of the User';

  @override
  Widget build(BuildContext context) {
    List<Location> locations = [
      Location(
        imageUrl: 'assets/images/home/Coto-Mines-Masinloc.jpg',
        name: 'Coto mines',
        link: 'https://example.com/location1',
      ),
      Location(
        imageUrl: 'assets/images/home/escape.png',
        name: 'escape',
        link: 'https://example.com/location1',
      ),
      // Add more locations here
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Container(
          color: const Color(0x59CDC7C7),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
                  // Wrap content in a Column
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center content vertically
                  children: [
                    const ImageGrid(),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF94DBC3),
                                    // Set background color with opacity
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5.0), // Add border radius
                                    ),
                                  ),
                                  child: const Text(
                                    'From',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      // Medium weight
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.015, // 10% of screen width
                              ),
                              Expanded(
                                  child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF94DBC3),
                                  // Set background color with opacity
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Add border radius
                                  ),
                                ),
                                child: const Text(
                                  'To',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    // Medium weight
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                            ],
                          ),
                          const DateSelectorRow(),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CustomSearchbar(),
                          ),
                        ],
                      ),
                    ),
                    LocationListPage(locations: locations),
                    ElevatedButton(
                        onPressed: () {
                          // openMap(lat, long);
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: const Text('Open Google Map'))
                  ],
                )),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: 0,
          onItemTapped: (p0) {},
        ));
  }
}
