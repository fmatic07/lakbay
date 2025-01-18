import 'package:flutter/material.dart';
import 'package:lakbay/model/Location.dart';

class LocationListPage extends StatelessWidget {
  final List<Location> locations;

  const LocationListPage({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Column(
              children: [
                Text(locations[index].name),
                const SizedBox(height: 3),
                Expanded(
                  // Use Expanded to make image consume full height
                  child: Image.asset(
                    locations[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
