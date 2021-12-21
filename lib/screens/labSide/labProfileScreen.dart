import 'package:flutter/material.dart';
import 'package:oladoc/services/auth.dart';

import '../customTabScreens.dart';

class LabProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lab'),
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
      body: Container(
        child: Text('Lab Profile Screen'),      
      ),
    );
  }
}