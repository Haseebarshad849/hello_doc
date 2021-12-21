import 'package:flutter/material.dart';
import 'package:oladoc/screens/authen/ButtonsSignUpScreen.dart';

class Badge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ButtonsSignUpScreen.routeName);
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Icon(Icons.person_add_outlined,
              color: Theme.of(context).primaryColor,),
            ),
          ),
          // Positioned(
          //   bottom: 4,
          //   right: 2,
          //   child: Container(
          //     padding: EdgeInsets.all(1.5),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30),
          //       color: Colors.grey[300],
          //     ),
          //     child: Icon(
          //       Icons.person_add,
          //       color: Colors.black,
          //       size: 14,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
