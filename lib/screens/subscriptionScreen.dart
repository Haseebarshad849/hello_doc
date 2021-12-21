import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  static const routeName = '/subscription-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Subscription'),
      ),
      body: Center(
        child: Text(
            'Currently You have no subscription'
        ),
      ),
    );
  }
}
