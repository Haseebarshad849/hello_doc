import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:oladoc/models/nutritionistModel/nutritionistModel.dart';
import 'package:oladoc/models/staticCollectionName.dart';
import 'package:oladoc/models/usersModel/personModel.dart';
import 'package:oladoc/screens/nutritionistSide/nutritionistEditProfileScreen.dart';
import 'package:oladoc/services/auth.dart';
import 'package:oladoc/services/cloudStore.dart';
import 'package:oladoc/widgets/drawers/commonDrawer.dart';
import '../customTabScreens.dart';
import 'nutritionistAppointmentScreen.dart';
import 'nutritionistSubscriptionScreen.dart';

class NutritionistProfileScreen extends StatefulWidget {
  static const routeName = 'nutritionist-profile-screen';


  @override
  _NutritionistProfileScreenState createState() => _NutritionistProfileScreenState();
}

class _NutritionistProfileScreenState extends State<NutritionistProfileScreen> {
  bool isLoading=false;
  String _uid = CloudStore().uid;
  NutritionistModel _nutritionistModel= NutritionistModel();
  PersonModel _personModel =PersonModel();



  @override
  void initState() {
    super.initState();
    getData();
  }

  getData()async{
    setState(() {
      isLoading=true;
    });
    CloudStore().getNutritionistData(collectionName: StaticCollection.nutritionists,uid: _uid).
    then(
      (value) {
        _nutritionistModel= value;
        if(value.mobileNo==null || value.education==null){
          return Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NutritionistEditProfileScreen(isEditingScreen: true,),),);
        }
      }
      );
    _personModel = await CloudStore().getPersonData(collectionName: StaticCollection.nutritionists);
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? Container(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Loading(
                  indicator: BallPulseIndicator(),
                  size: 75.0,
                  color: Theme.of(context).accentColor,
                ),
              ),
            )
          : Scaffold(
              drawer: CommonDrawer(
                nameText: '${_personModel.name}',
                mobileNumber: '${_nutritionistModel.mobileNo}',
                buttonOnPressed:
                    () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx)=> NutritionistEditProfileScreen(isEditingScreen: true,))
                  );
                },
                appointmentOnTap:
                    () {
                  Navigator.of(context).pushNamed(NutritionistAppointmentScreen.routeName);
                },
                profileOnTap:
                    () {
                  Navigator.of(context).pushReplacementNamed(NutritionistProfileScreen.routeName);
                },
                subscriptionOnTap:
                    () {
                  Navigator.of(context).pushNamed(NutritionistSubscriptionScreen.routeName);
                },
              ),
              appBar: AppBar(
                  title: Text(
                    "${_personModel?.name}",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color.fromRGBO(0, 0, 96, 1),
                  iconTheme:
                      IconThemeData(color: Theme.of(context).primaryColor),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () async {
                        AuthService().signOut();
                        Navigator.of(context).pushReplacementNamed(
                                  CustomTabScreens.routeName);
                      },
                    ),
                  ]),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //==========Profile Section========
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        color: Colors.white,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromRGBO(0, 0, 96, 1),
                                  maxRadius: 40,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      // color: Colors.purple,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${_personModel.name}',
                                        style:
                                            Theme.of(context).textTheme.headline5,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 4),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      alignment: Alignment.centerLeft,
                                      // color: Colors.purple,
                                      child: Text(
                                        '${_nutritionistModel?.fieldOfDoctrate}',
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      // color: Colors.purple,
                                      child: Text(
                                        '${_nutritionistModel.education}',
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        '${_nutritionistModel?.availablityDoc?.waitTime}',
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Wait Time',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(color: Colors.grey[700]),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.grey[400],
                                  width: 1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        '${_nutritionistModel?.totalExperience} Years',
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Experience',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(color: Colors.grey[700]),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.grey[400],
                                  width: 1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        '98% (244)',
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Satisfied',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(color: Colors.grey[700]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),

                      Container(
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
                                'Online Appointment',
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
                                'Rs. ${_nutritionistModel?.availablityDoc?.availibility?.fee}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 11,
                                    child: Icon(
                                      Icons.access_time_filled_outlined,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    child: Text(
                                      'Available Days',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.green),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width:MediaQuery.of(context).size.width / 1.8,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: _nutritionistModel?.availablityDoc?.availibility?.timing?.length,
                                        itemBuilder: (ctx,i){
                                        if(_nutritionistModel?.availablityDoc?.availibility?.timing[i]?.from==''
                                        && _nutritionistModel?.availablityDoc?.availibility?.timing[i]?.end=='')
                                        {return Container();}
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(vertical: 4),
                                              child: Text(
                                                  '${_nutritionistModel?.availablityDoc?.availibility?.timing[i]?.day}',
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(vertical: 4),
                                                  child: Text(
                                                          '${_nutritionistModel?.availablityDoc?.availibility?.timing[i]?.from}'

                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(vertical: 4),
                                                  child: Text(
                                                    '-  ${_nutritionistModel?.availablityDoc?.availibility?.timing[i]?.end}',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
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
                                'Hospital Appointment',
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
                                '${_nutritionistModel?.availibilityHospital?.hospitalName}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.purple,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Rs. ${_nutritionistModel.availibilityHospital.availibility.fee}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 11,
                                    child: Icon(
                                      Icons.access_time_filled_outlined,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.blue,
                                    width:
                                    MediaQuery.of(context).size.width / 4,
                                    child: Text(
                                      'Available Days',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.green),
                                    ),
                                  ),
                                  Container(
                                    width:MediaQuery.of(context).size.width / 1.8,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: _nutritionistModel.availibilityHospital.availibility.timing.length,
                                        itemBuilder: (ctx,i){
                                          if(_nutritionistModel.availibilityHospital.availibility.timing[i].from==''
                                              && _nutritionistModel.availibilityHospital.availibility.timing[i].end=='')
                                          {return Container();}
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 4),
                                                child: Text(
                                                  '${_nutritionistModel.availibilityHospital.availibility.timing[i].day}',
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 4),
                                                    child: Text(
                                                        '${_nutritionistModel.availibilityHospital.availibility.timing[i].from}'

                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 4),
                                                    child: Text(
                                                      '-  ${_nutritionistModel.availibilityHospital.availibility.timing[i].end}',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // =========='Clinic Appointment'==========
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
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
                                'Clinic Appointment',
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
                                '${_nutritionistModel.availibiltyClinic.clinicName}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.purple,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Address: ${_nutritionistModel.availibiltyClinic.address}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.purple,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Rs. ${_nutritionistModel.availibiltyClinic.availibility.fee}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 11,
                                    child: Icon(
                                      Icons.access_time_filled_outlined,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width / 4,
                                    child: Text(
                                      'Available Days',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.green),
                                    ),
                                  ),
                                  Container(
                                    width:MediaQuery.of(context).size.width / 1.8,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: _nutritionistModel.availibiltyClinic.availibility.timing.length,
                                        itemBuilder: (ctx,i){
                                          if(_nutritionistModel.availibiltyClinic.availibility.timing[i].from==''
                                              && _nutritionistModel.availibiltyClinic.availibility.timing[i].end=='')
                                          {return Container();}
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 4),
                                                child: Text(
                                                  '${_nutritionistModel.availibiltyClinic.availibility.timing[i].day}',
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 4),
                                                child: Text(
                                                    '${_nutritionistModel.availibiltyClinic.availibility.timing[i].from}'

                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 4),
                                                child: Text(
                                                  '-  ${_nutritionistModel.availibiltyClinic.availibility.timing[i].end}',
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //=========== Personal Homecare Assistant=======
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
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
                                'Personal Homecare',
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
                                'Rs. ${_nutritionistModel.personalHomecare.availibility.fee}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 11,
                                    child: Icon(
                                      Icons.access_time_filled_outlined,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width / 4,
                                    child: Text(
                                      'Available Days',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.green),
                                    ),
                                  ),
                                  Container(
                                    width:MediaQuery.of(context).size.width / 1.8,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: _nutritionistModel.personalHomecare.availibility.timing.length,
                                        itemBuilder: (ctx,i){
                                          if(_nutritionistModel.personalHomecare.availibility.timing[i].from==''
                                              && _nutritionistModel.personalHomecare.availibility.timing[i].end=='')
                                          {return Container();}
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 4),
                                                child: Text(
                                                  '${_nutritionistModel.personalHomecare.availibility.timing[i].day}',
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 4),
                                                child: Text(
                                                    '${_nutritionistModel.personalHomecare.availibility.timing[i].from}'

                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 4),
                                                child: Text(
                                                  '-  ${_nutritionistModel.personalHomecare.availibility.timing[i].end}',
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      //============== 'Education',===========
                      Container(
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
                                'Education',
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
                                '${_nutritionistModel?.education}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      //============== 'Total Experience',===========
                      Container(
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
                                'Total Experience',
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
                                'Experience of ${_nutritionistModel.totalExperience} years',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      //============== 'Professional MemberShip',===========
                      Container(
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
                                'Professional Membership',
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
                                '${_nutritionistModel.professionalMembership} Departments',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      //============== About Dr =============
                      Container(
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
                                'About ${_personModel.name}',
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
                                '${_nutritionistModel.summary}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
 }
}