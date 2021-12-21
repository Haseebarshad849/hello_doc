 import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:oladoc/models/commonModel/timingModel.dart';
import 'package:oladoc/models/hospitalModel/facilityModel.dart';
import 'package:oladoc/models/hospitalModel/hospitalModel.dart';
import 'package:oladoc/models/staticCollectionName.dart';
import 'package:oladoc/services/cloudStore.dart';
import 'package:oladoc/services/storage.dart';
import 'package:oladoc/widgets/customTextFormField.dart';
import 'package:oladoc/widgets/timeFieldWidget.dart';

import 'hospitalProfileScreen.dart';

class HospitalEditProfileScreen extends StatefulWidget {
  static const routeName = 'hospital-edit-profile-screen';
  final bool isEditingScreen;

  HospitalEditProfileScreen({this.isEditingScreen});

  @override
  _HospitalEditProfileScreenState createState() =>
      _HospitalEditProfileScreenState();
}

class _HospitalEditProfileScreenState extends State<HospitalEditProfileScreen> {
  HospitalModel _hospitalModel=HospitalModel();
  // PersonModel _personModel = PersonModel();
  bool isLoading=false;
  File image;
  String imageUrl='';
  TimingModel onlineAvailabilitytiming = TimingModel();
   List<TimingModel> _onlineDaysOfWeek =
      List.generate(7, (index) => TimingModel());
    // Facility _facility = Facility();
  GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  static List<String> facilities = [];

  @override
  void initState() {
    super.initState();
    // assignDays();
    // if(widget.isEditingScreen){
    //   isLoading=true;
    //   getFieldValues();
    
    // }
    
  }

  getFieldValues() async {
   _hospitalModel= await CloudStore().getHospitalData(
      collectionName: StaticCollection.hospitals,
      uid: CloudStore().uid
    );
    print(_hospitalModel.toMap());
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
          // textTheme: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
          automaticallyImplyLeading: widget.isEditingScreen? true:false,
          backgroundColor: Color.fromRGBO(0, 0, 96, 1),
          title: widget.isEditingScreen? Text(
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
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {
                saveProfile();
              },
              icon: Icon(Icons.save),
              tooltip: 'Save',
            ),
          ],
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: getImageFromGallery,
                    child:  Stack(
                      children: [CircleAvatar(
                        maxRadius: 70,
                        backgroundColor: Colors.blue[900],
                        backgroundImage: image!=null ? FileImage(image):AssetImage('assets/images/doctor.png') ,
                      ),
                      Positioned(
                        right: 10,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
                          child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                        ))
                      ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    initialValue: _hospitalModel?.username??'',
                    validator:(val)=> textFieldValidator(val),
                    hintText: 'User Name',
                    onChanged: (val) => _hospitalModel?.username = val,
                    labelText: 'User Name',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    initialValue: _hospitalModel?.address??'',
                    validator:(val)=> textFieldValidator(val),
                    hintText: 'Address',
                    onChanged: (val) => _hospitalModel.address = val,
                    labelText: 'Address',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    initialValue: _hospitalModel?.ptclNo??'',
                    validator:(val)=> textFieldValidator(val),
                    hintText: '042 378601',
                    onChanged: (val) => _hospitalModel.ptclNo = val,
                    labelText: 'Phone No.',
                    keyboardType: TextInputType.number,
                  ),
                 
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    initialValue: _hospitalModel?.contactPersonName??'',
                    validator:(val)=> textFieldValidator(val),
                    hintText: 'Muhammad Ali',
                    onChanged: (val)=>
                    _hospitalModel.contactPersonName=val,
                    labelText: 'Contact name',
                  ),
                   SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    initialValue: _hospitalModel?.contactPersonMobileNo??'',
                    validator:(val)=> textFieldValidator(val),
                    hintText: 'Contact person mobile no',
                    onChanged: (val) =>
                        _hospitalModel.contactPersonMobileNo = val,
                    labelText: 'Mobile No.',
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    initialValue: _hospitalModel?.phcRegNo??'',
                    validator:(val)=> textFieldValidator(val),
                    keyboardType: TextInputType.number,
                    hintText: 'PHC REG#.',
                    onChanged: (val) => _hospitalModel.phcRegNo = val,
                    labelText: 'PHC REG#',
                  ),
                   
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    initialValue: _hospitalModel?.about??'',
                    hintText: 'Write your details here',
                    onChanged: (val) => _hospitalModel.about = val,
                    labelText: 'About',
                    maxLines: 3,
                    validator:(val)=> textFieldValidator(val),
                  ),
                  SizedBox(height: 15),
                 ..._getFriends(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getImageFromGallery() async {
    final _image =
        await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 50).then((pickedFile) => pickedFile.path);
    print(_image.toString());
    setState(() {
      image = File(_image);
    });
    Storage().uploadImage(
      collectionName: StaticCollection.hospitals,
      image: image,
      imageUrl: imageUrl
    );
  }

    saveProfile()async{
    if (_formKey.currentState.validate()) {
      _hospitalModel.id= FirebaseAuth.instance.currentUser.uid;
    print(_hospitalModel.toMap());
      setState(() {
        isLoading=true;
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
    // facilities.forEach((element) { 
    //   Facility(facility: facilities);
    // });

    _hospitalModel.imageUrl =imageUrl ;
  await CloudStore().updateHospitalProfile(
    collectionName: StaticCollection.hospitals,
    hospitalModel: HospitalModel(
      username: _hospitalModel.username,
      about: _hospitalModel.about,
      address: _hospitalModel.address,
      contactPersonMobileNo: _hospitalModel.contactPersonMobileNo,
      contactPersonName: _hospitalModel.contactPersonName,
      facilities: Facility(facility: facilities),
      id: FirebaseAuth.instance.currentUser.uid,
      imageUrl: _hospitalModel.imageUrl,
      phcRegNo: _hospitalModel.phcRegNo,
      ptclNo: _hospitalModel.ptclNo

      )
  );
  setState(() {
        isLoading=false;
      });
  Navigator.of(context)
          .pushReplacementNamed(HospitalProfileScreen.routeName);
}

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
  
  String textFieldValidator(String val){
    if(val.isEmpty){
      return 'Must fill this field';
    }
    return null;
  }
  List<Widget> _getFriends(){
  List<Widget> friendsTextFieldsList = [];
  for(int i=0; i<facilities.length; i++){
    friendsTextFieldsList.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
             Expanded(child: FriendTextFields(i)),
             SizedBox(width: 16,),
             // we need add button at last friends row only
             _addRemoveButton(i == facilities.length-1, i),
          ],
        ),
      )
    );
  }
  return friendsTextFieldsList;
}
Widget _addRemoveButton(bool add, int index){
  return InkWell(
    onTap: (){
      if(add){
        // add new text-fields at the top of all friends textfields
        facilities.insert(0, null);
      }
      else facilities.removeAt(index);
      setState((){});
    },
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: (add) ? Color.fromRGBO(0, 0, 96, 1) : Colors.red[700],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        (add) ? Icons.add : Icons.remove, color: Colors.white,
      ),
    ),
  );
}

}

class FriendTextFields extends StatefulWidget {
  final int index;
  FriendTextFields(this.index);
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}
class _FriendTextFieldsState extends State<FriendTextFields> {
  TextEditingController _nameController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _HospitalEditProfileScreenState.facilities[widget.index]   
        ?? '';
    });
    return TextFormField(
      controller: _nameController,
      // save text field data in friends list at index 
      // whenever text field value changes
      onChanged: (v) => _HospitalEditProfileScreenState.facilities[widget.index] = v,
      // decoration: InputDecoration(
      //   hintText: 'Enter Facility name'
      // ),
      validator: (v){
        if(v.trim().isEmpty) return 'Must fill this field';
        return null;
      },
      // initialValue: _hospitalM,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.red[600],
            fontSize: 15.0,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.red[500],
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.red[500],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
              )),
          hintText: 'Enter Facility name',
          labelText: 'Facility',
          hintStyle: TextStyle(fontSize: 16.0, color: Colors.black26),
          labelStyle: TextStyle(fontSize: 14.0, color: Colors.black54),
        ),
        style: TextStyle(fontSize: 18.0),
    );
  }
}