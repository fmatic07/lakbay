import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 35.0),
          // Hero Stack (60% of height)
          Expanded(
            flex: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Container(
                width: double.infinity, // Full width
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/sunset_mayon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          // Main Text (30% of height)
          Expanded(
            flex: 25,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: double.infinity, // Full width
                  height: 170.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Explore.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Get Started Button (Remaining height)
          Expanded(
            flex: 8,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press (e.g., navigate to another screen)
                Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1EC089), // Color: #1EC089
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),

          SizedBox(height: 15.0)
        ],
      ),
    );
  }
}
