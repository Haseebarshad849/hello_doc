import 'package:flutter/material.dart';

class CustomCardContainer extends StatelessWidget {
  final double height;
  final Widget child;

  CustomCardContainer({
    this.height,
    this.child,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.teal,
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        width: double.infinity,
        height: height,
        child: child,
        // color: Colors.black,
      ),
    );
  }
}
