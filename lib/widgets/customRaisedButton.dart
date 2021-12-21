import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final String text;
  final double height;
  final Color color;
  final Function onPressed;

  const CustomRaisedButton({
  @required  this.text,
  @required  this.height,
  @required  this.color,
  @required  this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      // MediaQuery.of(context).size.height*0.1,
      child: RaisedButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 18.0),
          ),
          color: color,
          // Theme.of(context).accentColor,
          textColor: Theme.of(context).primaryColor,
          splashColor: Colors.deepOrange,
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: onPressed
          //   () async {
          // dynamic result = '';
          // if (_formKey.currentState.validate()) {
          //   _formKey.currentState.save();
          // result = await AuthService()
          //     .signInWithEmailPassword(_email, _password);
          // if (auth.currentUser == null) {
          //   print('Error Signing In');
          //   print(result);
          //   _scaffoldKey.currentState.showSnackBar(
          //       new SnackBar(content: new Text(result)));
          // } else {
          //   print('Signed In Successfull');
          //   Navigator.of(context).pushNamed(HomeScreen.routeName);
          // }
          // }
          // }
          ),
    );
  }
}
