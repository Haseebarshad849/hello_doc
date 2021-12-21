import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oladoc/screens/hospitalSide/hospitalEditProfileScreen.dart';
import 'package:oladoc/screens/nutritionistSide/nutritionistEditProfileScreen.dart';
import 'package:oladoc/models/staticCollectionName.dart';
import 'package:oladoc/models/typeModel.dart';
import 'package:oladoc/screens/doctorSide/doctorEditProfileScreen.dart';
import 'package:oladoc/screens/labSide/labEditProfileScreen.dart';
import 'package:oladoc/screens/nurseSide/nurseEditProfileScreen.dart';
import 'package:oladoc/screens/patientSide/patientEditProfileScreen.dart';
import 'package:oladoc/services/cloudStore.dart';
import '../../models/usersModel/personModel.dart';
import '../../services/auth.dart';
import '../../widgets/customRaisedButton.dart';
import '../../widgets/customTextFormField.dart';

class SignUpScreen extends StatefulWidget {
  final String type;
  static const routeName = '/signup-screen';

  const SignUpScreen({this.type});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _name, _email, _password, _confirmPassword;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: AutoSizeText(
                    'You\'re registering as: ${widget.type}',
                    minFontSize: 22,
                    wrapWords: true,
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.7,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/doctor.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // ====================
                      // ==== Name ========
                      // ====================
                      CustomTextFormField(
                        keyboardType: TextInputType.text,
                        validator:
                            (String value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length < 3) {
                            return 'Incorrect name';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            _name = val;
                          });
                        },
                        prefixIcon: Icon(Icons.person_outline, color: Colors.black87,),
                        hintText: 'Your Name',
                        labelText: 'Name',
                        obscureText: false,
                      ),
                      // ====================
                      // ==== Email ========
                      // ====================
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator:
                            (String value) {
                          if (value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Email you entered is incorrect';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            _email = val;
                          });
                        },
                        prefixIcon: Icon(Icons.mail_outline, color: Colors.black87,),
                        hintText: 'someone@hotmail.com',
                        labelText: 'Email',
                        obscureText: false,
                      ),
                      // ====================
                      // ==== Password ======
                      // ====================
                      CustomTextFormField(
                        keyboardType: TextInputType.text,
                        validator:
                            (String value) {
                              if (value.isEmpty) {
                                return 'Please enter password';
                              } else if (value.length < 6) {
                                return 'Password > 6 characters';
                              }
                              return null;
                            },
                        onChanged: (val) {
                          setState(() {
                            _password = val;
                          });
                        },
                        prefixIcon: Icon(Icons.lock_outline,
                          color: Colors.black87,
                        ),
                        hintText: 'Please enter your password',
                        labelText: 'Password',
                        obscureText: true,
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.text,
                        validator:
                            (String value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if(_confirmPassword!=_password){
                            return 'Password not matched';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            _confirmPassword = val;
                          });
                        },
                        prefixIcon: Icon(Icons.lock_outline,
                          color: Colors.black87,
                        ),
                        hintText: 'Please confirm your password',
                        labelText: 'Repeat Password',
                        obscureText: true,
                      ),
                      //========================================
                      // ==============Register Button==========
                      CustomRaisedButton(
                          color: Theme
                              .of(context)
                              .accentColor,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.09,
                          text: 'Register',
                          onPressed: () async {
                            onSubmitButton();
                          }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSubmitButton() async {
    dynamic result = '';
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      result = await AuthService()
          .registerAccountWithEmailPassword(
          _email, _password);

      if (auth.currentUser == null) {
        print('Error Creating Account');
        print(result);
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result), duration: Duration(seconds: 2),),);
      } else {
        print('Signed In Successfull');
        PersonModel personModel = PersonModel(
          password:_password ,
          name:_name ,
          email:_email ,
          id:  auth.currentUser.uid,
            type: widget.type
        );


        if(widget.type==StaticType.doctor){
          await CloudStore().addUser(collectionName: StaticCollection.doctors,
              person: personModel
          ).then((_) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (ctx)=> DoctorEditProfileScreen(isEditingScreen: false,)
            ),
          ));
        }
        if(widget.type==StaticType.patient){
         await CloudStore().addUser(collectionName: StaticCollection.patients,
              person: personModel
          ).then((_) =>  Navigator.of(context).pushReplacement(
           MaterialPageRoute(
               builder: (ctx)=> PatientEditProfileScreen(isEditingScreen: false,)
           ),
         ));

        }
        if(widget.type==StaticType.nurse){
          await CloudStore().addUser(collectionName: StaticCollection.nurses,
              person: personModel
          ).then((_) =>
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (ctx)=> NurseEditProfileScreen(isEditingScreen: false,)
            ),
          ));
        }
        if(widget.type==StaticType.hospital){
          await CloudStore().addUser(collectionName: StaticCollection.hospitals,
              person: personModel
          ).then((_) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (ctx)=> HospitalEditProfileScreen(isEditingScreen: false,)
            ),
          ));
        }
        if(widget.type==StaticType.nutrionist){
          await CloudStore().addUser(collectionName: StaticCollection.nutritionists,
              person: personModel
          ).then((_) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (ctx)=> NutritionistEditProfileScreen(isEditingScreen: false,)
            ),
          ));
        }
        if(widget.type==StaticType.labstest){
          await CloudStore().addUser(collectionName: StaticCollection.labs,
              person: personModel
          ).then((_) =>  Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (ctx)=> LabEditProfileScreen(isEditingScreen: false,)
            ),
          ));
        }

      }
    }
  }
}