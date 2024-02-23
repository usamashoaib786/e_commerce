import 'package:flutter/material.dart';
import 'package:tt_offer/Utils/resources/res/app_theme.dart';
import 'package:tt_offer/View/ChatScreens/chat_screen.dart';
import 'package:tt_offer/View/Homepage/landing_screen.dart';
import 'package:tt_offer/View/Post%20screens/post_screen.dart';
import 'package:tt_offer/View/Profile%20Screen/profile_screen.dart';
import 'package:tt_offer/View/Settings/setting_screen.dart';

class BottomNavView extends StatefulWidget {
  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    LandingScreen(),
    ChatScreen(),
    PostScreen(),
    SettingScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home-2.png',
              width: 30,
              height: 30,
              color: _selectedIndex == 0 ? AppTheme.appColor : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/messages.png',
              width: 30,
              color: _selectedIndex == 1 ? AppTheme.appColor : Colors.grey,
              height: 30,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/camera.png',
              width: 30,
              color: _selectedIndex == 2 ? AppTheme.appColor : Colors.grey,
              height: 30,
            ),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/tag-2.png',
              width: 30,
              height: 30,
              color: _selectedIndex == 3 ? AppTheme.appColor : Colors.grey,
            ),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/user.png',
              width: 30,
              color: _selectedIndex == 4 ? AppTheme.appColor : Colors.grey,
              height: 30,
            ),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.appColor,
        unselectedItemColor:
            Colors.grey, // Change the selected item's color here
        showSelectedLabels: true, // Show labels for selected item
        showUnselectedLabels: true, // Show labels for unselected items
        onTap: _onItemTapped,
      ),
    );
  }
}
