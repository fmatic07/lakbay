import 'package:flutter/cupertino.dart';
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
      margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 35.0),
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          color: CupertinoColors.systemGreen,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25), bottom: Radius.circular(25))),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: GNav(
          padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 25.0),
          backgroundColor: CupertinoColors.systemGreen,
          activeColor: Colors.white,
          color: Colors.white,
          tabBackgroundColor: Colors.white24,
          gap: 3,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            // GButton(
            //   icon: Icons.calendar_month,
            //   text: 'Schedule',
            // ),
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
