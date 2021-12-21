import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:oladoc/models/nurseModel/nurseModel.dart';
import 'package:oladoc/models/staticCollectionName.dart';
import 'package:oladoc/models/usersModel/personModel.dart';
import 'package:oladoc/screens/doctorSide/doctorSubscriptionScreen.dart';
import 'package:oladoc/screens/nurseSide/nurseEditProfileScreen.dart';
import 'package:oladoc/services/auth.dart';
import 'package:oladoc/services/cloudStore.dart';
import 'package:oladoc/widgets/drawers/commonDrawer.dart';
import 'package:oladoc/widgets/profileContainer.dart';
import '../customTabScreens.dart';

class NurseProfileScreen extends StatefulWidget {
  static const routeName = 'nurse-profile-screen';

  @override
  _NurseProfileScreenState createState() => _NurseProfileScreenState();
}

class _NurseProfileScreenState extends State<NurseProfileScreen> {
  NurseModel _nurseModel = NurseModel();
  PersonModel _person = PersonModel();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
     _person= await CloudStore().getPersonData(
      collectionName: StaticCollection.nurses,
    );
      await CloudStore()
        .getNurseData(
            collectionName: StaticCollection.nurses, uid: CloudStore().uid)
            .then((val) {
      _nurseModel=val;
      if(val.registrationNo==null || val.nursingField==null){
        return Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NurseEditProfileScreen(isEditingScreen: true,),),);
      }else{
        print('This is executed');
        return null;
      }});
    print(_person.toMap());
    setState(() {
      isLoading = false;
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
        appBar: AppBar(
            title: Text('${_person?.name}',style: TextStyle(color: Colors.white),),
            backgroundColor: Color.fromRGBO(0, 0, 96, 1),
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                ),
                onPressed: () {
                  AuthService().signOut();
                  Navigator.of(context)
                      .pushReplacementNamed(CustomTabScreens.routeName);
                },
              ),
            ]),
            drawer: CommonDrawer(
              nameText: '${_person.name}',
              mobileNumber: '${_nurseModel.mobileNo}',
              buttonOnPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx)=> NurseEditProfileScreen(isEditingScreen: true,),),
                  );
                },
                appointmentOnTap: () {
                  Navigator.of(context).pushNamed(DoctorSubscriptionScreen.routeName);
                },
                profileOnTap: () {
                  Navigator.of(context).pushReplacementNamed(NurseProfileScreen.routeName);
                },
                subscriptionOnTap: () {
                  Navigator.of(context).pushNamed(DoctorSubscriptionScreen.routeName);
                },
            ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child:
                CircleAvatar(
                  maxRadius: 70,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(
                    Icons.image,
                    size: 80,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ProfileContainer(
                  headingText: 'Username',
                  paraText: '${_nurseModel.userName}',
              ),
               SizedBox(
                height: 40,
              ),
              ProfileContainer(
                  headingText: 'Father name',
                  paraText: '${_nurseModel.fatherName}',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ProfileContainer(
                  headingText: 'Address',
                  paraText: '${_nurseModel.address}',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ProfileContainer(
                  headingText: 'Email',
                  paraText: '${_nurseModel?.email}',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ProfileContainer(
                  headingText: 'Mobile No',
                  paraText: '${_nurseModel.mobileNo}',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ProfileContainer(
                  headingText: 'CNIC',
                  paraText: '${_nurseModel.cnic}',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ProfileContainer(
                  headingText: 'Working Hospital Name',
                  paraText: '${_nurseModel.hospitalName}',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ProfileContainer(
                  headingText: 'Nursing Field',
                  paraText: '${_nurseModel.nursingField}',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    'Available days',
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
                                    itemCount: _nurseModel.timingModel.length,
                                      itemBuilder: (ctx,i){
                                      if(_nurseModel.timingModel[i].from==''
                                      && _nurseModel.timingModel[i].end=='')
                                      {return Container();}
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 4),
                                            child: Text(
                                                '${_nurseModel.timingModel[i].day}',
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 4),
                                                child: Text(
                                                        '${_nurseModel.timingModel[i].from}'

                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(vertical: 4),
                                                child: Text(
                                                  '-  ${_nurseModel.timingModel[i].end}',
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
                          ProfileContainer(
                                  headingText: 'Education',
                                  paraText: '${_nurseModel.education}',
                                ),
                                SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ProfileContainer(
                                  headingText: 'Registration no',
                                  paraText: '${_nurseModel.registrationNo}',
                                ),
                                SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
ProfileContainer(
                                  headingText: 'Fee per hour',
                                  paraText: '${_nurseModel.feePerHour}',
                                ),
                                 SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
ProfileContainer(
                                  headingText: 'Fee per week',
                                  paraText: '${_nurseModel.feePerWeek}',
                                ),
                                 SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
ProfileContainer(
                                  headingText: 'Fee per month',
                                  paraText: '${_nurseModel.feePerMonth}',
                                ),
            ],
          ),
        ),
      ),
    );
  }
}