import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
      padding: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
          color: Color(0xff1EC089),
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(25), bottom: Radius.circular(20))
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: GNav(
          padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0),
          backgroundColor: Color(0xff1EC089),
          activeColor: Colors.white,
          color: Colors.white,
          tabBackgroundColor: Colors.white24,
          gap: 3,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.calendar_month,
              text: 'Schedule',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'saved',
            ),
            GButton(
              icon: Icons.account_box,
              text: 'account',
            ),
          ],
        ),
      ),
    );
  }
}
