import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travel_app/View/Pages/homePage.dart';
import 'package:travel_app/View/Pages/profilePage.dart';
import 'package:travel_app/View/Pages/savePage.dart';
import 'package:travel_app/View/Pages/searchPage.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  static List<Widget> pages = [
    HomePage(),
    SearchPage(),
    SavePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: pages.elementAt(_currentIndex),
      bottomNavigationBar: GNav(
        onTabChange: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        tabBorderRadius: 10,
        gap: 8,
        color: Colors.grey,
        activeColor: Colors.white,
        iconSize: 24,
        tabBackgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
        tabMargin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        tabs: [
        GButton(
          icon: Icons.home_filled,
          text: 'Home',
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
        ),
        GButton(
          icon: Icons.bookmark,
          text: 'Save',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ]),
    ));
  }
}
