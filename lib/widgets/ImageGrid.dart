import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImage('assets/images/home/beach.png'),
                _buildImage('assets/images/home/cultural.png'),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.015, // 10% of screen width
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImage('assets/images/home/tourism.png'),
                _buildImage('assets/images/home/retreat.png'),
                _buildImage('assets/images/home/escape.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        // border: Border.all(color: Colors.grey, width: 1.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color
            spreadRadius: 3, // How much the shadow spreads
            blurRadius: 3, // Blur radius
            offset: const Offset(10, 10), // Offset in x and y direction
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 10.0, right: 2.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
