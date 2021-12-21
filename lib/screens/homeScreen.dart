import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:oladoc/screens/patientSide/patientSearchScreen.dart';
import 'package:oladoc/widgets/customCardContainer.dart';
import 'package:oladoc/widgets/categoryGridViewBuilder.dart';
import 'package:oladoc/widgets/specialityGridBuilder.dart';
import '../widgets/badge.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Hello Doctor',
        ),
        leading: Badge(),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
              //.....
              print('Location Button pressed');
            },
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text('Lahore'),
                Icon(Icons.expand_more),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    width: 150,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      'Good Afternoon!',
                      style: Theme.of(context).textTheme.headline6,
                      minFontSize: 16,
                    ),
                  ),
                  // Spacer(),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                child: CategoryGrid(),
              ),
              SizedBox(
                height: 5.0,
              ),
              CustomCardContainer(
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        // color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical:8.0),
                          child: Text('Find a Doctor',
                          style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.search),
                            ),
                            Container(
                              child: Text(
                                'Doctors, Specialization, Hospital',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey),
                        ),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Doctors online > Start consulting',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Card(
                // color: Colors.purple,
                elevation: 6,
                child: Column(
                  children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height *0.06,
                    child: Text('Top Doctor Specialities',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                    SpecialityGrid(
                      itemCount: 6,
                    ),
                    GestureDetector(
                      onTap:()=> Navigator.of(context).pushNamed(PatientSearchScreen.routeName),
                      child: Container(
                        decoration:BoxDecoration(
                          border: Border.all(),
                        ),
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.centerLeft,
                        height: MediaQuery.of(context).size.height *0.07,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Find other specialities  ',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 4),
                  height: MediaQuery.of(context).size.height * 0.07,
                decoration:BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Get an appointment with Doctor',
                  style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.06,
                      // color: Colors.deepOrange,
                      child: Text('Top Hospitals List',
                      style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    CategoryGrid(),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              CustomCardContainer(
                height: MediaQuery.of(context).size.height * 0.065,
                child: Row(
                  children: [
                    Container(
                      child: Text('FAQ    |',style: Theme.of(context).textTheme.bodyText2,),
                    ),
                    Container(
                      child: Text('   Policy ',style: Theme.of(context).textTheme.bodyText2,),
                    ),
                    Spacer(),
                    Container(
                      child: Text('Powered by inforesume edge',style: Theme.of(context).textTheme.bodyText2,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}