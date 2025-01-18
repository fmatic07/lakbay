import 'package:flutter/material.dart';
import 'package:lakbay/screens/home_screen.dart';
import 'package:lakbay/screens/landing_screen.dart';
import 'package:lakbay/screens/profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/' : (context) => const LandingScreen(),
  '/home' : (context) => const HomeScreen(),
  '/profile' : (context) => const ProfileScreen(),
};

