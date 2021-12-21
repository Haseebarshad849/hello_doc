import 'package:flutter/material.dart';
import 'package:oladoc/screens/doctorSide/doctorAppointmentScreen.dart';
import 'package:oladoc/screens/doctorSide/doctorProfileScreen.dart';

class DoctorTabScreens extends StatefulWidget {
  static const routeName = '/doctors-tabs-screen';
  @override
  _DoctorTabScreensState createState() => _DoctorTabScreensState();
}

class _DoctorTabScreensState extends State<DoctorTabScreens> {
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
        'page': DoctorProfileScreen(),
        'title': 'HomeScreen',
      },
      {
        'page': DoctorAppointmentsScreen(),
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Appointments',
          ),
        ],
      ),
    );
  }
}
