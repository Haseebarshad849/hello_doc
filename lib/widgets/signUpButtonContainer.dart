import 'package:flutter/material.dart';

class SignUpScreenContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  SignUpScreenContainer({
    this.color=Colors.white,
  @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: child,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height*0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.8, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ]
      ),
    );
  }
}
