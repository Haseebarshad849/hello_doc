import 'package:flutter/material.dart';

class MyAppointmentScreen extends StatelessWidget {
  static const routeName = '/my-appointment-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Appointment Screen'),
      ),
      body: Center(
        child: Text(
            'My Appointment Screen'
        ),
      ),
    );
  }
}
