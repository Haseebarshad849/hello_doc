import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth = FirebaseAuth.instance;

//    ========  LOGIN  ===========
  Future signInWithEmailPassword(String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      // ignore: non_constant_identifier_names
      User user = result.user;

      return user;
    } catch (e) {
      print(e.toString());
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong Pasword.';
      }
    }
  }

  //    ========  SIGNUP FIREBASE  ===========
  Future registerAccountWithEmailPassword(String email, String password) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      // ignore: non_constant_identifier_names
      User user = result.user;

      return user;
    } catch (e) {
      print(e.toString());
      if (e.code == 'email-already-in-use') {
        return 'Email already registered.';
      } else if (e.code == 'weak-password') {
        return 'Enter a strong password';
      } else if (e.code == 'invalid-email') {
        return 'Wrong Pasword.';
      }
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
