import 'package:flutter/material.dart';
import 'package:oladoc/services/auth.dart';

import '../customTabScreens.dart';

class PatientProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient'),
       backgroundColor: Color.fromRGBO(0, 0, 96, 1),
                  iconTheme:
                      IconThemeData(color: Theme.of(context).primaryColor),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        AuthService().signOut();
                        Navigator.of(context).pushReplacementNamed(
                                  CustomTabScreens.routeName);
                      },
                    ),
                  ]),
      body: Center(
        child: Text('This is Patient Profile Screen'),
      ),
    );
  }
}