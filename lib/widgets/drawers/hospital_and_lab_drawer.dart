//************************* Drawer Screen*********************************
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oladoc/screens/customTabScreens.dart';

class HospAndLabDrawer extends StatefulWidget {
  final String nameText;
  final Function buttonOnPressed;
  final Function profileOnTap;
  final Function subscriptionOnTap;

  HospAndLabDrawer({
    this.nameText,
    this.buttonOnPressed,
    this.profileOnTap,
    this.subscriptionOnTap,
  });

  @override
  _HospAndLabDrawerState createState() => _HospAndLabDrawerState();
}

class _HospAndLabDrawerState extends State<HospAndLabDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 96, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.nameText}',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: widget.buttonOnPressed,
                  child: Text("Complete your profile",style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(0, 0, 96, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text('My Profile'),
            leading: Icon(Icons.person,
            color: Color.fromRGBO(0, 0, 96, 1),
            ),
            onTap: widget.profileOnTap,
          ),
          Divider(),
          ListTile(
            title: Text('My Subscription'),
            leading: Icon(Icons.subscriptions,
            color: Color.fromRGBO(0, 0, 96, 1),),
            onTap: widget.subscriptionOnTap,
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout,
            color: Color.fromRGBO(0, 0, 96, 1),),
            onTap: () async {
              await FirebaseAuth.instance.signOut().then(
                    (_) => Navigator.of(context)
                        .pushReplacementNamed(CustomTabScreens.routeName),
                  );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
