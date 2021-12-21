import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:ui';

import 'package:oladoc/widgets/customTextFormField.dart';


class PatientEditProfileScreen extends StatefulWidget {
  final bool isEditingScreen;
  final File image;
  const PatientEditProfileScreen({Key key, this.image,this.isEditingScreen}) : super(key: key);
  @override
  _PatientEditProfileScreenState createState() => _PatientEditProfileScreenState();
}
class _PatientEditProfileScreenState extends State<PatientEditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 96, 1),
          title: Text(
            "Complete Profile",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  maxRadius: 70,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(
                    Icons.image,
                    size: 80,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  hintText: 'User Name',
                  onChanged: null,
                  labelText: 'User Name',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'Address',
                  onChanged: null,
                  labelText: 'Address',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'Mobile',
                  onChanged: null,
                  labelText: 'Mobile No.',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'Occupation',
                  onChanged: null,
                  labelText: 'Occupation',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'CNIC No.',
                  onChanged: null,
                  labelText: 'CNIC No.',
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
    );
  }
  Future<void> uploadImage() async {
    var imageUrl;
    var storageReference = FirebaseStorage.instance
        .ref()
        .child('pictures')
        .child(DateTime.now().millisecondsSinceEpoch.toString());
    await storageReference.putFile(widget.image);
    storageReference.getDownloadURL().then((value) async {
      imageUrl = value.toString();
      print(imageUrl);
      await FirebaseFirestore.instance.collection('image Url').doc().set({
        'url': imageUrl,
      });
    });
  }
  final picker = ImagePicker();
  Future getimageFromGallery() async {
    final pickedfile =
    await picker.getImage(source: ImageSource.gallery, imageQuality: 100);
    Future getimageFromCamera() async {
      final pickedfile =
      await picker.getImage(source: ImageSource.camera, imageQuality: 100);
    }
  }
   String textFieldValidator(String val){
    if(val.isEmpty){
      return 'Must fill this field';
    }
    return null;
  }
}