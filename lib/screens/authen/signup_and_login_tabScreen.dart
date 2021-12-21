import 'package:flutter/material.dart';
import 'package:oladoc/screens/authen/logInScreen.dart';
import 'package:oladoc/screens/authen/signUpScreen.dart';

class LoginSignupTabScreen extends StatefulWidget {
  final String type;

  const LoginSignupTabScreen({this.type});
  @override
  _LoginSignupTabScreenState createState() => _LoginSignupTabScreenState();
}

class _LoginSignupTabScreenState extends State<LoginSignupTabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // =======  BY DEFAULT THE INITIAL INDEX VALUE IS 0 ==============
      // ======= IN CASE OF WHATSAPP INTIAL INDEX IS 1  ==============
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.type} login/register'),
          bottom: TabBar(
            labelColor: Colors.purple,
            indicatorColor: Colors.purple,
            unselectedLabelColor: Colors.black26,

            tabs: [
              Tab(
                icon: Icon(Icons.email),
                text: 'Login',
              ),
              Tab(
                icon: Icon(Icons.person_add),
                text: 'Register',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginScreen(type: widget.type),
            SignUpScreen(type: widget.type,),
          ],
        ),
      ),
    );
  }
}
