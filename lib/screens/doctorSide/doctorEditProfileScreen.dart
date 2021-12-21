import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:oladoc/models/commonModel/availablity.dart';
import 'package:oladoc/models/commonModel/availibilityDoc.dart';
import 'package:oladoc/models/commonModel/availibilityPersonalHomecare.dart';
import 'package:oladoc/models/commonModel/availibilityPrivateClinic.dart';
import 'package:oladoc/models/commonModel/avalibilityHospitalNames.dart';
import 'package:oladoc/models/commonModel/timingModel.dart';
import 'package:oladoc/models/specialityModel.dart';
import 'package:oladoc/models/doctorModel/doctorModel.dart';
import 'package:oladoc/models/staticCollectionName.dart';
import 'package:oladoc/providers/specialityProvider.dart';
import 'package:oladoc/screens/doctorSide/doctorProfileScreen.dart';
import 'package:oladoc/services/cloudStore.dart';
import 'package:oladoc/widgets/customTextFormField.dart';
import 'package:oladoc/widgets/dropDownButtonC.dart';
import 'package:oladoc/widgets/timeFieldWidget.dart';
import 'package:provider/provider.dart';

class DoctorEditProfileScreen extends StatefulWidget {
  static const routeName = 'doctor-edit-profile-screen';
  final bool isEditingScreen;

  DoctorEditProfileScreen({this.isEditingScreen});

  @override
  _DoctorEditProfileScreenState createState() => _DoctorEditProfileScreenState();
}

class _DoctorEditProfileScreenState extends State<DoctorEditProfileScreen> {
  String _onlineFee, _hospitalFee, _clinicFee, _personalFee;
  bool _isInitState = true;
  bool isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AvailabilityDoc availabilityDoc = AvailabilityDoc();
  Availibility availibility = Availibility();
  TimingModel privateDaysTiming = TimingModel();
  TimingModel onlineAvailabilitytiming = TimingModel();
  TimingModel hospitalDaysTiming = TimingModel();
  TimingModel personalDaysTiming = TimingModel();
  SpecialityModel specialization = SpecialityModel();
  AvailibilityHospitalNames _availibilityHospitalNames =
      AvailibilityHospitalNames();
  AvailibilityPrivateClinic _availibilityPrivateClinic =
      AvailibilityPrivateClinic();
  AvailibilityPersonalHomecare _availibilityPersonalHomecare =
      AvailibilityPersonalHomecare();
  DoctorModel doctorModel = DoctorModel();
  List<TimingModel> _personalDaysOfWeek =
      List.generate(7, (index) => TimingModel());
  List<TimingModel> _onlineDaysOfWeek =
      List.generate(7, (index) => TimingModel());
  List<TimingModel> _hospitalDaysOfWeek =
      List.generate(7, (index) => TimingModel());
  List<TimingModel> _privateDaysOfWeek =
      List.generate(7, (index) => TimingModel());
  List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    'Sunday'
  ];

  List<SpecialityModel> _speciality;

  DoctorModel _initValues = DoctorModel();

  @override
  void initState() {
    super.initState();
    assignDays();

    if (widget.isEditingScreen) {
      isLoading = true;
      getFieldValues();
    }
    if (_isInitState) {
      _speciality =
          Provider.of<SpecialityProvider>(context, listen: false).specialities;
    }
    _isInitState = false;
  }

  getFieldValues() async {
    CloudStore()
        .getDoctorData(
            collectionName: 'doctors',
            uid: FirebaseAuth.instance.currentUser.uid)
        .then((value) {
      setState(() {
        _initValues = DoctorModel.fromMap(value.toMap());
        print("llllllllllll");
        isLoading = false;
      });
    });
  }

  void assignDays() {
    for (int i = 0; i < 7; i++) {
      _personalDaysOfWeek[i].day = weekDays[i] ?? '';
    }
    for (int i = 0; i < 7; i++) {
      _onlineDaysOfWeek[i].day = weekDays[i] ?? '';
    }
    for (int i = 0; i < 7; i++) {
      _hospitalDaysOfWeek[i].day = weekDays[i] ?? '';
    }
    for (int i = 0; i < 7; i++) {
      _privateDaysOfWeek[i].day = weekDays[i] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => true,
      child: Scaffold(
        appBar: AppBar(
            title: widget.isEditingScreen
                ? Text(
                    'Edit profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                : Text('Complete profile',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue[900],
            iconTheme: IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.save,
                  // color: Theme.of(context).accentColor,
                ),
                onPressed: saveAvailibilityTimingModel,
                tooltip: 'Save',
              ),
            ]),
        body: isLoading
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
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          initialValue: _initValues.username ?? '',
                          keyboardType: TextInputType.text,
                          hintText: 'doctor123',
                          labelText: 'Username',
                          onChanged: (val) {
                            doctorModel.username = val;
                          },
                          validator:(val)=> textFieldValidator(val),
                        ),
                        CustomTextFormField(
                          initialValue: _initValues.mobileNo ?? '',
                          hintText: 'Your phone number',
                          labelText: 'Mobile',
                          onChanged: (val) {
                            doctorModel.mobileNo = val;
                          },
                          validator:(val)=> textFieldValidator(val),
                        ),
                        CustomTextFormField(
                          initialValue: _initValues.specialization,
                          keyboardType: TextInputType.text,
                          hintText: 'Specialization Field',
                          labelText: 'Specialization',
                          onChanged: (val) => specialization.title = val,
                          validator:(val)=> textFieldValidator(val),
                        ),
                        DropDownButtonC(
                          items: _speciality.map((e) => e.title).toList(),
                          label: 'Field of Doctrate',
                          selectedKey: _initValues.fieldOfDoctrate??'',
                          onItemSelected: (String value) {
                            setState(() {
                              _initValues.fieldOfDoctrate = value;
                              // print(_fieldOfDoctrate);
                            });
                          },
                        ),
                        CustomTextFormField(
                          initialValue: _initValues.summary ?? '',
                          hintText: 'Write summary details here',
                          labelText: 'Summary',
                          maxLines: 3,
                          onChanged: (val) => doctorModel.summary = val,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter summary';
                            }
                            if (value.length < 10) {
                              return 'Summary should be atleast 10 characters long ';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          initialValue: _initValues.education,
                          keyboardType: TextInputType.text,
                          hintText: 'e.g. M.B.B.S (Dermatology)',
                          labelText: 'Education',
                          onChanged: (val) => doctorModel.education = val,
                          validator:(val)=> textFieldValidator(val),
                        ),
                        Row(children: [
                          Flexible(
                            child: CustomTextFormField(
                              initialValue:
                                  _initValues?.professionalMembership ?? '',
                              keyboardType: TextInputType.text,
                              hintText: 'Membership department',
                              labelText: 'Professional membership',
                              onChanged: (val) =>
                                  doctorModel.professionalMembership = val,
                              validator:(val)=> textFieldValidator(val),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width / 3,
                            alignment: Alignment.center,
                            child: Text(
                              'Department Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ]),
                        Row(children: [
                          Flexible(
                            child: CustomTextFormField(
                              initialValue: _initValues.totalExperience ?? '',
                              keyboardType: TextInputType.number,
                              hintText: 'Total Experience',
                              labelText: 'Experience',
                              onChanged: (val) =>
                                  doctorModel.totalExperience = val,
                              validator:(val){
                                if(val.isEmpty){
                                  return 'Year can\'t be empty';
                                }
                                if(val.length>2){
                                  return 'Please fill correct year';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width / 3,
                            alignment: Alignment.center,
                            child: Text(
                              'Years',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ]),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 8),
                          child: Text(
                            'Availibility online consultation',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.blue[900]),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                          decoration: BoxDecoration(border: Border.all(width: 1)),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _onlineDaysOfWeek.length,
                              shrinkWrap: true,
                              itemBuilder: (ctx, i) {
                                return days(
                                    list: _onlineDaysOfWeek,
                                    index: i,
                                    day: _onlineDaysOfWeek[i].day);
                              }),
                        ),
                        DropDownButtonC(
                          items: [
                            'Under 10 mins',
                            'Under 15 mins',
                            'Under 20 mins',
                            'Under 25 mins',
                            'Under 30 mins',
                          ],
                          label: 'Wait time',
                          selectedKey: _initValues.availablityDoc?.waitTime??'',
                          onItemSelected: (val) {
                          setState(() {
                            print('-----------------');
                            print(val);
                            AvailabilityDoc _availablityDoc =AvailabilityDoc(waitTime: val);
                            _initValues.availablityDoc=_availablityDoc ;
                            // print();
                          });
                          FocusScope.of(context).unfocus();
                        },
                        ),
                        CustomTextFormField(
                          initialValue: _initValues.totalExperience ?? '',
                          validator:(val)=> textFieldValidator(val),
                          onChanged: (val) {
                            _onlineFee = val;
                          },
                          hintText: 'Enter fee',
                          labelText: 'Fee',
                          keyboardType: TextInputType.number,
                        ),
                        //=================================================
                        //==========='Availibility Hospital Details'======
                        //=================================================
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Availibility Hospital Details',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.blue[900]),
                          ),
                        ),
                        CustomTextFormField(
                          initialValue: _initValues.availibilityHospital?.hospitalName??'',
                          onChanged: (val) =>
                              _availibilityHospitalNames.hospitalName = val,
                          hintText: 'Name of Hospital',
                          labelText: 'Hospital',
                          validator:(val)=> textFieldValidator(val),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                          decoration: BoxDecoration(border: Border.all(width: 1)),
                          // height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _hospitalDaysOfWeek.length,
                              shrinkWrap: true,
                              itemBuilder: (ctx, i) {
                                return days(
                                    list: _hospitalDaysOfWeek,
                                    index: i,
                                    day: _hospitalDaysOfWeek[i].day);
                              }),
                        ),
                        CustomTextFormField(
                          initialValue: _initValues.availibilityHospital?.address??'',
                          onChanged: (val) =>
                              _availibilityHospitalNames.address = val,
                          hintText: 'Enter hospital address',
                          labelText: 'Address',
                          validator:(val)=> textFieldValidator(val),
                        ),
                        CustomTextFormField(
                            initialValue: _initValues.availibilityHospital?.availibility?.fee??'',
                          onChanged: (val) => _hospitalFee = val,
                          hintText: 'Enter fee',
                          labelText: 'Fee',
                          keyboardType: TextInputType.number,
                           validator:(val)=> textFieldValidator(val),
                        ),
                        //=================================================
                        //==========='Availibility Private Clinic'======
                        //=================================================
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Availibility Private Clinic',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.blue[900]),
                          ),
                        ),
                        CustomTextFormField(
                           validator:(val)=> textFieldValidator(val),
                          initialValue: _initValues.availibiltyClinic?.clinicName??'',
                          onChanged: (val) =>
                              _availibilityPrivateClinic.clinicName = val,
                          hintText: 'Your clinic name',
                          labelText: 'Clinic name',
                        ),
                        CustomTextFormField(
                           validator:(val)=> textFieldValidator(val),
                          initialValue: _initValues.availibiltyClinic?.address??'',
                          onChanged: (val) =>
                              _availibilityPrivateClinic.address = val,
                          hintText: 'Enter your clinic address',
                          labelText: 'Clinic address',
                        ),
                        CustomTextFormField(
                           validator:(val)=> textFieldValidator(val),
                          initialValue: _initValues.availibiltyClinic?.availibility?.fee??'',
                          onChanged: (val) => _clinicFee = val,
                          hintText: 'Enter clinic fee',
                          labelText: 'Clinic fee',
                          keyboardType: TextInputType.number,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                          decoration: BoxDecoration(border: Border.all(width: 1)),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _privateDaysOfWeek.length,
                              shrinkWrap: true,
                              itemBuilder: (ctx, i) {
                                return days(
                                    list: _privateDaysOfWeek,
                                    index: i,
                                    day: _privateDaysOfWeek[i].day);
                              }),
                        ),
                        //=================================================
                        //========'Availibility as personal homecare'======
                        //=================================================
                        Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Availibility as personal homecare assistant',
                            style: Theme.of(context).textTheme.headline6.copyWith(
                                  color: Colors.blue[900],
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CustomTextFormField(
                          validator:(val)=> textFieldValidator(val),
                          initialValue: _initValues.personalHomecare?.availibility?.fee??'',
                          onChanged: (val) => _personalFee = val,
                          hintText: 'Enter homecare fee',
                          labelText: 'Homecare fee',
                          keyboardType: TextInputType.number,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                          decoration: BoxDecoration(border: Border.all(width: 1)),
                          // height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _personalDaysOfWeek.length,
                              shrinkWrap: true,
                              itemBuilder: (ctx, i) {
                                return days(
                                    list: _personalDaysOfWeek,
                                    index: i,
                                    day: _personalDaysOfWeek[i].day);
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget days({String day, int index, List<TimingModel> list}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            day,
            // _daysOfWeek[i].day,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontStyle: FontStyle.normal),
          ),
        ),
        Row(
          children: [
            TimeFieldWidget(
              initialValue: '',
              labelText: 'From',
              onChanged: (val) {
                print(val);
                setState(() {
                  list[index].from = val;
                  // _daysOfWeek[i].from = val;
                });
              },
            ),
            Text(
              '-',
              style: Theme.of(context).textTheme.headline6,
            ),
            TimeFieldWidget(
              labelText: 'To',
              onChanged: (val) {
                setState(() {
                  list[index].end = val;
                  // _daysOfWeek[i].end = val;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  saveAvailibilityTimingModel() async {
    _privateDaysOfWeek.forEach((element) {
      if (element.from != null && element.end != null) {
        privateDaysTiming =
            TimingModel(day: element.day, end: element.end, from: element.from);
        print(privateDaysTiming.toMap());
      }
    });
    _onlineDaysOfWeek.forEach((element) {
      if (element.from != null && element.end != null) {
        onlineAvailabilitytiming =
            TimingModel(day: element.day, end: element.end, from: element.from);
        print(onlineAvailabilitytiming.toMap());
      }
    });
    _onlineDaysOfWeek.forEach((element) {
      print(element.toMap());
    });
    // print(_onlineDaysOfWeek);
    _hospitalDaysOfWeek.forEach((element) {
      if (element.from != null && element.end != null) {
        hospitalDaysTiming =
            TimingModel(day: element.day, end: element.end, from: element.from);
        print(hospitalDaysTiming.toMap());
      }
    });
    _personalDaysOfWeek.forEach((element) {
      if (element.from != null && element.end != null) {
        personalDaysTiming =
            TimingModel(day: element.day, end: element.end, from: element.from);
        print(personalDaysTiming.toMap());
      }
    });
    if (_formKey.currentState.validate()) {
  setState(() {
    isLoading = true;
  });
  await CloudStore()
      .updateDocProfile(
    collectionName: StaticCollection.doctors,
    doctorModel: DoctorModel(
      id: FirebaseAuth.instance.currentUser.uid,
      education: doctorModel.education,
      fieldOfDoctrate: _initValues.fieldOfDoctrate,
      mobileNo: doctorModel.mobileNo,
      professionalMembership: doctorModel.professionalMembership,
      specialization: specialization.title,
      summary: doctorModel.summary,
      totalExperience: doctorModel.totalExperience,
      username: doctorModel.username,
      availablityDoc: AvailabilityDoc(
        availibility: Availibility(
          timing: _onlineDaysOfWeek,
          isAvailable: false,
          fee: _onlineFee,
        ),
        waitTime: _initValues.availablityDoc.waitTime,
      ),
      availibilityHospital: AvailibilityHospitalNames(
        availibility: Availibility(
            isAvailable: false,
            timing: _hospitalDaysOfWeek,
            fee: _hospitalFee),
        address: _availibilityHospitalNames.address,
        hospitalName: _availibilityHospitalNames.hospitalName,
      ),
      availibiltyClinic: AvailibilityPrivateClinic(
        clinicName: _availibilityPrivateClinic.clinicName,
        address: _availibilityPrivateClinic.address,
        availibility: Availibility(
          isAvailable: false,
          timing: _privateDaysOfWeek,
          fee: _clinicFee,
        ),
      ),
      personalHomecare: AvailibilityPersonalHomecare(
        availibility: Availibility(
          timing: _personalDaysOfWeek,
          isAvailable: false,
          fee: _personalFee,
        ),
      ),
    ),
  )
      .then((_) {
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pushReplacementNamed(DoctorProfileScreen.routeName);
  });
}
  }
  String textFieldValidator(String val){
    if(val.isEmpty){
      return 'Must fill this field';
    }
    return null;
  }
}