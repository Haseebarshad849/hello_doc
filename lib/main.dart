import 'package:flutter/material.dart';
import 'package:oladoc/screens/authen/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

//providers
import './providers/categoryProvider.dart';
import './providers/specialityProvider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
           create: (ctx)=> CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx)=> SpecialityProvider(),
        ),
      ],
      child: MaterialApp(
      title: 'Hello Doctor',
      debugShowCheckedModeBanner: false,
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
      home: Wrapper(),
    ),
    );
  }
}
