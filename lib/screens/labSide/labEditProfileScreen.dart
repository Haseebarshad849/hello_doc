import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oladoc/widgets/customTextFormField.dart';


class LabEditProfileScreen extends StatefulWidget {
  final bool isEditingScreen;
  final File image;
  const LabEditProfileScreen({Key key, this.image,this.isEditingScreen}) : super(key: key);
  @override
  _LabEditProfileScreenState createState() => _LabEditProfileScreenState();
}
class _LabEditProfileScreenState extends State<LabEditProfileScreen> {
  bool flag=false;
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
        body: SingleChildScrollView(
          child: Form(
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
                    hintText: 'Lab Name',
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
                    hintText: 'Phone',
                    onChanged: null,
                    labelText: 'Phone No.',
                    keyboardType: TextInputType.number,
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
                    hintText: 'Contact Person',
                    onChanged: null,
                    labelText: 'Contact Person',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hintText: 'PHC Registration number',
                    onChanged: null,
                    labelText: 'PHC REG#',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hintText: 'About',
                    onChanged: null,
                    labelText: 'About',
                    maxLines: 3,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Free Home Collection Facility available ?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Visibility(
                    visible: flag,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: 'Contact person name',
                          onChanged: null,
                          labelText: 'Contact person',
                        ),
                        SizedBox(height: 15),
                        CustomTextFormField(
                          hintText: 'Contact person number',
                          onChanged: null,
                          labelText: 'Contact number',
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            flag = true;
                            setState(() {});
                          },
                          child: Text("Yes")),
                      ElevatedButton(
                          onPressed: () {
                            flag = false;
                            setState(() {});
                          },
                          child: Text("No")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // Future<void> uploadImage() async {
  //   var imageUrl;
  //   var storageReference = FirebaseStorage.instance
  //       .ref()
  //       .child('pictures')
  //       .child(DateTime.now().millisecondsSinceEpoch.toString());
  //   await storageReference.putFile(widget.image);
  //   storageReference.getDownloadURL().then((value) async {
  //     imageUrl = value.toString();
  //     print(imageUrl);
  //     await FirebaseFirestore.instance.collection('image Url').doc().set({
  //       'url': imageUrl,
  //     });
  //   });
  // }
  // final picker = ImagePicker();
  // Future getimageFromGallery() async {
  //   final pickedfile =
  //   await picker.getImage(source: ImageSource.gallery, imageQuality: 100);
  //   Future getimageFromCamera() async {
  //     final pickedfile =
  //     await picker.getImage(source: ImageSource.camera, imageQuality: 100);
  //   }
  // }
}