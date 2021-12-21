import 'package:flutter/material.dart';

class NutritionistSubscriptionScreen extends StatelessWidget {
  static const routeName = 'nutritionist-subscription-screen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Screen'),
        ),
        body: Center(child: Text('Nutritionist Subscription Screen'),),
      
    );
  }
}