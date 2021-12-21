import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oladoc/models/staticCollectionName.dart';
import 'package:oladoc/models/typeModel.dart';
import 'package:oladoc/screens/authen/ButtonsSignUpScreen.dart';
import 'package:oladoc/screens/authen/logInScreen.dart';
import 'package:oladoc/screens/authen/signUpScreen.dart';
import 'package:oladoc/screens/customTabScreens.dart';
import 'package:oladoc/screens/doctorSide/doctorAppointmentScreen.dart';
import 'package:oladoc/screens/doctorSide/doctorEditProfileScreen.dart';
import 'package:oladoc/screens/doctorSide/doctorProfileScreen.dart';
import 'package:oladoc/screens/doctorSide/doctorSubscriptionScreen.dart';
import 'package:oladoc/screens/doctorSide/doctorTabScreen.dart';
import 'package:oladoc/screens/hospitalSide/hospitalEditProfileScreen.dart';
import 'package:oladoc/screens/hospitalSide/hospitalProfileScreen.dart';
import 'package:oladoc/screens/labSide/labProfileScreen.dart';
import 'package:oladoc/screens/myAppointmentScreen.dart';
import 'package:oladoc/screens/nurseSide/nurseProfileScreen.dart';
import 'package:oladoc/screens/nutritionistSide/nutritionistAppointmentScreen.dart';
import 'package:oladoc/screens/nutritionistSide/nutritionistEditProfileScreen.dart';
import 'package:oladoc/screens/nutritionistSide/nutritionistProfileScreen.dart';
import 'package:oladoc/screens/patientSide/patientProfileScreen.dart';
import 'package:oladoc/screens/patientSide/patientSearchScreen.dart';
import 'package:oladoc/services/auth.dart';
import '../homeScreen.dart';
import '../subscriptionScreen.dart';

class Wrapper extends StatefulWidget {

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String type;

@override
  void initState() {
    super.initState();
    getDoctorData();
    getHospitalData();
    getLabData();
    getNurseData();
    getNutritionistData();
    getPatientData();
  }

  getDoctorData()async{
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      FirebaseFirestore.instance
          .collection(StaticCollection.doctors)
          .doc(uid)
          .get()
          .then((value) {
        Map m = value.data();
        setState(() {
          type = m['type'];
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  getHospitalData()async{
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      FirebaseFirestore.instance
          .collection(StaticCollection.hospitals)
          .doc(uid)
          .get()
          .then((value) {
        Map m = value.data();
        setState(() {
          type = m['type'];
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
  getNurseData()async{
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      FirebaseFirestore.instance
          .collection(StaticCollection.nurses)
          .doc(uid)
          .get()
          .then((value) {
        Map m = value.data();
        setState(() {
          type = m['type'];
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
  getPatientData()async{
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      FirebaseFirestore.instance
          .collection(StaticCollection.patients)
          .doc(uid)
          .get()
          .then((value) {
        Map m = value.data();
        setState(() {
          type = m['type'];
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
  getLabData()async{
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      FirebaseFirestore.instance
          .collection(StaticCollection.labs)
          .doc(uid)
          .get()
          .then((value) {
        Map m = value.data();
        setState(() {
          type = m['type'];
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
  getNutritionistData()async{
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      FirebaseFirestore.instance
          .collection(StaticCollection.nutritionists)
          .doc(uid)
          .get()
          .then((value) {
        Map m = value.data();
        setState(() {
          type = m['type'];
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.orangeAccent,
        backgroundColor: Colors.grey[200],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 18,
          ),
          bodyText1: TextStyle(
            fontSize: 12,
          ),
          bodyText2: TextStyle(
            fontSize: 14
          )
        ),
      ),
      routes: {
        HomeScreen.routeName:(ctx)=> HomeScreen(),
        // COMMON SCREENS
        ButtonsSignUpScreen.routeName: (ctx)=> ButtonsSignUpScreen(),
        MyAppointmentScreen.routeName:(ctx)=> MyAppointmentScreen(),
        SubscriptionScreen.routeName: (ctx)=> SubscriptionScreen(),
        SignUpScreen.routeName:(ctx)=>SignUpScreen(),
        LoginScreen.routeName:(ctx)=>LoginScreen(),
        PatientSearchScreen.routeName:(ctx)=>PatientSearchScreen(),

        // DOCTORS SCREEN
        DoctorProfileScreen.routeName:(ctx)=>DoctorProfileScreen(),
        DoctorEditProfileScreen.routeName:(ctx)=>DoctorEditProfileScreen(),
        CustomTabScreens.routeName: (ctx)=> CustomTabScreens(),
        DoctorAppointmentsScreen.routeName: (ctx)=> DoctorAppointmentsScreen(),
        DoctorTabScreens.routeName:(ctx)=> DoctorTabScreens(),
        DoctorSubscriptionScreen.routeName:(ctx)=> DoctorSubscriptionScreen(),

        // HOSPITAL SCREENS
        HospitalProfileScreen.routeName:(ctx)=>HospitalProfileScreen(),
        HospitalEditProfileScreen.routeName:(ctx)=>HospitalEditProfileScreen(),
        
        // NUTRITIONIST SCREENS
        NutritionistProfileScreen.routeName:(ctx)=> NutritionistProfileScreen(),
        NutritionistEditProfileScreen.routeName:(ctx)=> NutritionistEditProfileScreen(),
        NutritionistAppointmentScreen.routeName:(ctx)=> NutritionistAppointmentScreen(),

        //NURSE SCREENS
        NurseProfileScreen.routeName: (ctx)=>NurseProfileScreen(),

      },
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User>(
        stream: AuthService().auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(type==StaticType.doctor){
             return DoctorTabScreens();
            }
            else if(type==StaticType.hospital){
              return HospitalProfileScreen();
            }else if(type==StaticType.patient){
              return PatientProfileScreen();
            }else if(type==StaticType.nurse){
              return NurseProfileScreen();
            }else if(type==StaticType.labstest){
              return LabProfileScreen();
            }else if(type==StaticType.nutrionist){
              return CustomTabScreens();
            }
            return Container();
          } 
          else {
            return CustomTabScreens();
          }
        },
      ),
    );
  }
}