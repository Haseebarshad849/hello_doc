import 'package:flutter/material.dart';
import 'package:oladoc/screens/homeScreen.dart';
import 'package:oladoc/screens/myAppointmentScreen.dart';
import 'package:oladoc/screens/subscriptionScreen.dart';

class BottomNavigationBarC extends StatefulWidget {
  @override
  _BottomNavigationBarCState createState() => _BottomNavigationBarCState();
}

class _BottomNavigationBarCState extends State<BottomNavigationBarC> {
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
      return BottomNavigationBar(
          iconSize: 20,
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
              label: 'My Appointment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: 'Subscription',
            ),
          ],
      );
    }
}
