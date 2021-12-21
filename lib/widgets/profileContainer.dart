import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String headingText;
  final String paraText;
  bool isNull;

  ProfileContainer({this.headingText, this.paraText});

  @override
  Widget build(BuildContext context) {
    return Container(
                  color: Colors.white,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.purple,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          headingText,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.purple,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          paraText,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                );
  }
}