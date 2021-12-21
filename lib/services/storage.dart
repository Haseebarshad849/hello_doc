import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class Storage{
  Future<void> uploadImage({String collectionName, String imageUrl, File image}) async {
    var storageReference = FirebaseStorage.instance
        .ref()
        .child(collectionName)
        .child('images/${Path.basename(image.path)}');
    await storageReference.putFile(image);
    storageReference.getDownloadURL().then((value) async {
      String uid = FirebaseAuth.instance.currentUser.uid;
      imageUrl = value.toString();
      print(imageUrl);
      print('==================');
      await FirebaseFirestore.instance.collection(collectionName).doc(uid).set({
        'imageUrl': imageUrl,
      },SetOptions(merge: true));
    });
  }
}