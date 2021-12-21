import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:oladoc/models/hospitalModel/hospitalModel.dart';
import 'package:oladoc/models/staticCollectionName.dart';
import 'package:oladoc/models/usersModel/personModel.dart';
import 'package:oladoc/screens/hospitalSide/hospitalEditProfileScreen.dart';
import 'package:oladoc/services/cloudStore.dart';
import 'package:oladoc/widgets/drawers/hospital_and_lab_drawer.dart';

import '../customTabScreens.dart';

class HospitalProfileScreen extends StatefulWidget {
  static const routeName='hospital-profile-screen';
  @override
  _HospitalProfileScreenState createState() => _HospitalProfileScreenState();
}

class _HospitalProfileScreenState extends State<HospitalProfileScreen> {
  
  bool isLoading;

  // FirebaseAuth
  FirebaseAuth auth = FirebaseAuth.instance;

  // Models
  HospitalModel _hospitalModel;
  PersonModel _personModel;


  @override
  void initState() {
    super.initState();
    getHospital();
  }

  getHospital()async{
    setState(() {
      isLoading= true;
    });
     _hospitalModel= await CloudStore().getHospitalData(
       collectionName: StaticCollection.hospitals,
       uid: auth.currentUser.uid
     );
     _personModel= await CloudStore().getPersonData(
       collectionName: StaticCollection.hospitals
     );
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: isLoading
          ? Container(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Loading(
                  indicator: BallPulseIndicator(),
                  size: 75.0,
                  color: Theme.of(context).accentColor,
                ),
              ),
            )
          : Scaffold(
              drawer: HospAndLabDrawer(
                nameText: '${_personModel.name}',
                buttonOnPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx)=> HospitalEditProfileScreen(isEditingScreen: true,),),
                  );
                },
                profileOnTap:  () {
                  Navigator.of(context).pushReplacementNamed(HospitalProfileScreen.routeName);
                },
              ),
              appBar: AppBar(
                  title: Text(
                    "${_personModel?.name}",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color.fromRGBO(0, 0, 96, 1),
                  iconTheme:
                      IconThemeData(color: Theme.of(context).primaryColor),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut().then(
                              (_) => Navigator.of(context).pushReplacementNamed(
                                  CustomTabScreens.routeName),
                            );
                      },
                    ),
                  ]),
        body: Center(
          child: Text('This is hospital Profile'),
        ),
                  ),
    );
  }
}
