import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:oladoc/models/commonModel/timingModel.dart';
import 'package:oladoc/models/nurseModel/nurseModel.dart';
import 'package:oladoc/models/staticCollectionName.dart';
import 'package:oladoc/screens/nurseSide/nurseProfileScreen.dart';
import 'package:oladoc/services/cloudStore.dart';
import 'package:oladoc/widgets/customTextFormField.dart';
import 'package:oladoc/widgets/timeFieldWidget.dart';

class NurseEditProfileScreen extends StatefulWidget {
  final bool isEditingScreen;
  NurseEditProfileScreen({this.isEditingScreen});

  @override
  _NurseEditProfileScreenState createState() => _NurseEditProfileScreenState();
}

class _NurseEditProfileScreenState extends State<NurseEditProfileScreen> {
  bool isLoading;
  NurseModel _nurseModel =NurseModel();
  // PersonModel _pModel = PersonModel();
   TimingModel onlineAvailabilitytiming = TimingModel();
   List<TimingModel> _onlineDaysOfWeek =
      List.generate(7, (index) => TimingModel());
  GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    assignDays();
    if(widget.isEditingScreen){
      isLoading=true;
      getFieldValues();
    }
    
  }

   getFieldValues() async {
    CloudStore()
        .getNurseData(
            collectionName: StaticCollection.nurses,
            uid: CloudStore().uid)
        .then((value) {
      setState(() {
        _nurseModel = NurseModel.fromMap(value.toMap());
        print("llllllllllll");
        isLoading = false;
      });
    });
  }

  List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    'Sunday'
  ];

   void assignDays() {
    for (int i = 0; i < 7; i++) {
      _onlineDaysOfWeek[i].day = weekDays[i] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 0, 96, 1),
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
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.save,
                ),
                onPressed: saveAvailibilityTimingModel,
                tooltip: 'Save',
              ),
            ]
          ),
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
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    CircleAvatar(
                      maxRadius: 70,
                      // backgroundColor: Colors.grey.shade300,
                      // child: imageUrl!=null ? Image.asset('assets/images/doctor.png'):Image.file(image),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.userName??'',
                      hintText: 'User Name',
                      onChanged: (val)=> _nurseModel.userName=val,
                      labelText: 'User Name',
                    ),
                  
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.fatherName??='',
                      hintText: 'Father Name',
                      onChanged: (val)=> _nurseModel.fatherName=val,
                      labelText: 'Father Name',
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.address??='',
                      hintText: 'Address',
                      onChanged: (val)=> _nurseModel.address=val,
                      labelText: 'Address',
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.cnic??='',
                      hintText: 'CNIC No.',
                      onChanged: (val)=> _nurseModel.cnic=val,
                      labelText: 'CNIC No.',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.mobileNo??='',
                      hintText: 'Mobile',
                      onChanged: (val)=> _nurseModel.mobileNo=val,
                      labelText: 'Mobile No.',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.hospitalName??='',
                      hintText: 'Hospital Name',
                      onChanged: (val)=> _nurseModel.hospitalName=val,
                      labelText: 'Hospital Name',
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.nursingField??='',
                      hintText: 'Nursing Field',
                      onChanged: (val)=> _nurseModel.nursingField=val,
                      labelText: 'Nursing Field',
                    ),
                    // *********************
                    //    Timing Model
                    Container(
                          padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 8),
                          child: Text(
                            'Availibility hospital timing',
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
                    // *********************
                    // CustomTextFormField(
                    //   hintText: 'Are you Avaiable for private home care :',
                    //   onChanged: (bool val)=> _nurseModel.isAvailable=val,
                    //   labelText: 'Private home care :',
                    // ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.education??='',
                      hintText: 'Education',
                      onChanged:(val)=> _nurseModel.education=val,
                      labelText: 'Education',
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.registrationNo.toString()??'',
                      hintText: 'Registration No.',
                      onChanged: (val)=> _nurseModel.registrationNo=val,
                      labelText: 'Registration No.',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                      initialValue: _nurseModel.feePerHour.toString()??'',
                      hintText: 'Fee per hour',
                      onChanged: (val)=> _nurseModel.feePerHour=val,
                      labelText: 'Fee per hour',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                       initialValue: _nurseModel.feePerWeek.toString()??'',
                      hintText: 'Fee per week',
                      onChanged: (val)=> _nurseModel.feePerWeek=val,
                      labelText: 'Fee per week',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                       initialValue: _nurseModel.feePerMonth.toString()??'',
                      hintText: 'Fee monthly',
                      onChanged: (val)=> _nurseModel.feePerMonth=val,
                      labelText: 'Fee monthly',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                       initialValue: _nurseModel.bankName??'',
                      hintText: 'Bank Name',
                      onChanged: (val)=> _nurseModel.bankName=val,
                      labelText: 'Bank Name',
                      keyboardType: TextInputType.name,
                    ),
                    CustomTextFormField(
                      validator:(val)=> textFieldValidator(val),
                       initialValue: _nurseModel.bankAccountNo.toString()??'',
                      hintText: 'Account No.',
                      onChanged: (val)=>_nurseModel.bankAccountNo=val,
                      labelText: 'Account No.',
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 15,
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
    if (_formKey.currentState.validate()) {
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
  setState(() {
    isLoading = true;
  });
  print(_nurseModel.feePerHour);
  print(_nurseModel.feePerWeek);
  print(_nurseModel.feePerMonth);

  await CloudStore()
      .updateNurseProfile(
        collectionName: StaticCollection.nurses,
        nurseModel: NurseModel(
          address: _nurseModel.address,
          bankAccountNo: _nurseModel.bankAccountNo,
          bankName: _nurseModel.bankName,
          cnic: _nurseModel.cnic,
          education: _nurseModel.education,
          fatherName: _nurseModel.fatherName,
          feePerHour: _nurseModel.feePerHour,
          feePerMonth: _nurseModel.feePerMonth,
          feePerWeek: _nurseModel.feePerWeek,
          hospitalName: _nurseModel.hospitalName,
          id: CloudStore().uid,
          imageUrl: _nurseModel.imageUrl,
          isAvailable: _nurseModel.isAvailable,
          mobileNo: _nurseModel.mobileNo,
          nursingField: _nurseModel.nursingField,
          registrationNo: _nurseModel.registrationNo,
          timingModel: _onlineDaysOfWeek,
          userName: _nurseModel.userName,
        )
      )
      .then((_) {
    setState(() {
      isLoading = false;
    });
    // Navigator.of(context).pushReplacementNamed(NurseProfileScreen.routeName);
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