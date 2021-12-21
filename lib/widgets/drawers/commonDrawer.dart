//************************* Drawer Screen*********************************
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oladoc/screens/customTabScreens.dart';

class CommonDrawer extends StatefulWidget {
  final String nameText;
  final String mobileNumber;
  final Function buttonOnPressed;
  final Function profileOnTap;
  final Function appointmentOnTap;
  final Function subscriptionOnTap;

  CommonDrawer({
    this.nameText,
    this.mobileNumber,
    this.buttonOnPressed,
    this.profileOnTap,
    this.appointmentOnTap,
    this.subscriptionOnTap,
  });

  @override
  _CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
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
                  '${widget.nameText} \n${widget.mobileNumber}',
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
            leading: Icon(Icons.person),
            onTap: widget.profileOnTap,
          ),
          Divider(),
          ListTile(
            title: Text('Booked Appointments'),
            leading: Icon(Icons.list),
            onTap: widget.appointmentOnTap,
          ),
          Divider(),
          ListTile(
            title: Text('My Subscription'),
            leading: Icon(Icons.subscriptions),
            onTap: widget.subscriptionOnTap,
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
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
