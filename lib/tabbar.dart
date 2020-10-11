import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:never_again/screens/HomeScreen.dart';
import 'package:never_again/screens/chatScreen.dart';
import 'package:never_again/screens/discoverScreen.dart';
import 'package:never_again/screens/profileScreen.dart';
import 'package:never_again/screens/statisticsScreen.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    // DiscoverScreen(),
    StatisticsScreen(),
    ChatScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
        ]),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (mediaQuery.width * 0.018),
              vertical: mediaQuery.height * 0.01),
          child: GNav(
            gap: mediaQuery.width * 0.02,
            activeColor: Colors.white,
            iconSize: mediaQuery.height * 0.03,
            padding: EdgeInsets.symmetric(
                horizontal: (mediaQuery.width * 0.05),
                vertical: (mediaQuery.height * 0.01)),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: Colors.grey[800],
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              // GButton(icon: Icons.public, text: 'Discover'),
              GButton(icon: Icons.show_chart_rounded, text: 'Statistics'),
              GButton(icon: Icons.chat, text: 'Chat'),
              GButton(icon: Icons.account_circle, text: 'Profile')
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        )),
      ),
    );
  }
}
