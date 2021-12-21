import 'package:flutter/material.dart';

import './homeScreen.dart';
import './myAppointmentScreen.dart';
import './subscriptionScreen.dart';

class CustomTabScreens extends StatefulWidget {
  static const routeName = '/custom-tabs-screen';
  @override
  _CustomTabScreensState createState() => _CustomTabScreensState();
}

class _CustomTabScreensState extends State<CustomTabScreens> {
  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'HomeScreen',
      },
      {
        'page': MyAppointmentScreen(),
        'title': 'Your Favorites',
      },
      {
        'page': SubscriptionScreen(),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black45,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            label: 'Subscription',
          ),
        ],
      ),
    );
  }
}
