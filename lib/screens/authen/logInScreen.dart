import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:oladoc/screens/authen/wrapper.dart';
import '../../services/auth.dart';
import '../../widgets/customRaisedButton.dart';
import '../../widgets/customTextFormField.dart';
import '../authen/wrapper.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  final String type;

  LoginScreen({this.type});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  bool isLoading = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      key: _scaffoldKey,
      body: isLoading
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
          : Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.25,
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
                        onChanged: (val){
                          setState(() {
                            _email=val;
                          });
                        },
                        prefixIcon: Icon(Icons.person_outline,color: Colors.black87,),
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
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onChanged: (val){
                          setState(() {
                            _password=val;
                          });
                        },
                        prefixIcon: Icon(Icons.lock_outline,
                          color: Colors.black87,
                        ),
                        hintText: 'Please enter your password',
                        labelText: 'Password',
                        obscureText: true,
                      ),
                      CustomRaisedButton(
                        color:  Theme.of(context).accentColor,
                        height: MediaQuery.of(context).size.height*0.09,
                        text: 'Submit',
                        onPressed: ()async{
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
  onSubmitButton()
   async {

     dynamic result = '';
     if (_formKey.currentState.validate()) {
       _formKey.currentState.save();
       setState(() {
         isLoading = true;
       });
       result = await AuthService()
           .signInWithEmailPassword(_email, _password);
       if (auth.currentUser == null) {
         print('Error Signing In');
         print(result);
         ScaffoldMessenger.of(context).hideCurrentSnackBar();
         ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text(result),
               duration: Duration(seconds: 2),
             )
         );
         setState(() {
           isLoading = false;
         });
       }
       else {
         return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>
         Wrapper()));
       }
     }
   }
}


