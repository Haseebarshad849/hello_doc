import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:oladoc/models/typeModel.dart';
import 'package:oladoc/screens/authen/signup_and_login_tabScreen.dart';
import 'package:oladoc/widgets/signUpButtonContainer.dart';

class ButtonsSignUpScreen extends StatefulWidget {
  static const routeName = 'signup-screen';

  @override
  _ButtonsSignUpScreenState createState() => _ButtonsSignUpScreenState();
}

class _ButtonsSignUpScreenState extends State<ButtonsSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBarC(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // width: ,
              child: Text(
                'Sign up/Login',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            LoginSignupTabScreen(type: StaticType.doctor)));
                  },
                  child: SignUpScreenContainer(
                    child: AutoSizeText(
                      'Doctor/Specialist\nLogin/Register',
                      maxLines: 2,
                      minFontSize: 16,
                      maxFontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            LoginSignupTabScreen(type: StaticType.patient)));
                  },
                  child: SignUpScreenContainer(
                    child: AutoSizeText(
                      'Patient\nLogin/Register',
                      maxLines: 2,
                      minFontSize: 16,
                      maxFontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginSignupTabScreen(
                          type: StaticType.hospital,
                        ),
                      ),
                    );
                  },
                  child: SignUpScreenContainer(
                    child: AutoSizeText(
                      'Hospital\nLogin/Register',
                      maxLines: 2,
                      minFontSize: 16,
                      maxFontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginSignupTabScreen(type: StaticType.nurse),
                      ),
                    );
                  },
                  child: SignUpScreenContainer(
                    child: AutoSizeText(
                      'Nurse\nLogin/Register',
                      maxLines: 2,
                      minFontSize: 16,
                      maxFontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginSignupTabScreen(type: StaticType.nutrionist),
                      ),
                    );
                  },
                  child: SignUpScreenContainer(
                    child: AutoSizeText(
                      'Nutrionist\nLogin/Register',
                      maxLines: 2,
                      minFontSize: 16,
                      maxFontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginSignupTabScreen(type: StaticType.labstest),
                      ),
                    );
                  },
                  child: SignUpScreenContainer(
                    child: AutoSizeText(
                      'Labs Test\nLogin/Register',
                      maxLines: 2,
                      minFontSize: 16,
                      maxFontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
