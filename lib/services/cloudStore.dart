import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oladoc/models/hospitalModel/hospitalModel.dart';
import 'package:oladoc/models/labModel/labModel.dart';
import 'package:oladoc/models/nurseModel/nurseModel.dart';
import 'package:oladoc/models/nutritionistModel/nutritionistModel.dart';
import 'package:oladoc/models/doctorModel/doctorModel.dart';
import 'package:oladoc/models/patientModel/patientModel.dart';
import '../models/usersModel/personModel.dart';

class CloudStore {
  // Create a CollectionReference called users that references the firestore collection
  final firestore = FirebaseFirestore.instance;
  String type;
  final auth = FirebaseAuth.instance;
  final uid= FirebaseAuth.instance.currentUser.uid;
  // users.orderBy('name');

  Future<void> addUser({ String collectionName,
    PersonModel person,
  }) {
    return firestore.collection(collectionName).doc(person.id).set(person.toMap());
  }

  // Future<void> getType({PersonModel person}){
  //   return firestore.collection().where();
  // }

  //---------------- Update Profile Functions ==================

  Future<void> updateDocProfile({String collectionName, DoctorModel doctorModel}){
    return firestore.collection(collectionName).doc(doctorModel.id).set(doctorModel.toMap(),SetOptions(merge: true));
  }

  Future<void> updateNutritionistProfile({String collectionName, NutritionistModel nutritionistModel}){
    return firestore.collection(collectionName).doc(nutritionistModel.id).set(nutritionistModel.toMap(),SetOptions(merge: true));
  }

  Future<void> updateHospitalProfile({String collectionName, HospitalModel hospitalModel}){
    return firestore.collection(collectionName).doc(hospitalModel.id).set(hospitalModel.toMap(),SetOptions(merge: true));
  }

  Future<void> updateLabProfile({String collectionName, LabModel labModel}){
    return firestore.collection(collectionName).doc(labModel.id).set(labModel.toMap(),SetOptions(merge: true));
  }

  Future<void> updatePatientProfile({String collectionName, PatientModel patientModel}){
    return firestore.collection(collectionName).doc(patientModel.id).set(patientModel.toMap(),SetOptions(merge: true));
  }

  Future<void> updateNurseProfile({String collectionName, NurseModel nurseModel}){
    return firestore.collection(collectionName).doc(nurseModel.id).set(nurseModel.toMap(),SetOptions(merge: true));
  }



  //============== Get person data ====================

  Future<PersonModel> getPersonData({String collectionName})async{
    String uid = auth.currentUser.uid;
    try{
      DocumentSnapshot snapshot = await firestore.collection(collectionName).doc(uid).get();
      return PersonModel.fromMap(snapshot.data());
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //============== Get Doctor Model data ====================

  Future<DoctorModel> getDoctorData({String collectionName, String uid}) async {
    try {
      DocumentSnapshot snapshot=   await firestore
          .collection(collectionName)
          .doc(uid)
          .get();
      print(snapshot.data());
        return DoctorModel.fromMap(snapshot.data());

    } catch (e) {
      print('THis is the eerrroroor $e');
      return null;
    }
  }
  //============== Get Hospital Model data ====================

  Future<HospitalModel> getHospitalData({String collectionName, String uid}) async {
    try {
      DocumentSnapshot snapshot=   await firestore
          .collection(collectionName)
          .doc(uid)
          .get();
      // print(snapshot.data());
      return HospitalModel.fromMap(snapshot.data());
    } catch (e) {
      // print('THis is the eerrroroor $e');
      return null;
    }
  }
  //============== Get Patient Model data ====================

  Future<PatientModel> getPatientData({String collectionName, String uid}) async {
    try {
      DocumentSnapshot snapshot= await firestore
          .collection(collectionName)
          .doc(uid)
          .get();
      print(snapshot.data());
      return PatientModel.fromMap(snapshot.data());

    } catch (e) {
      print('THis is the eerrroroor $e');
      return null;
    }
  }
  //============== Get Nurse Model data ====================

  Future<NurseModel> getNurseData({String collectionName, String uid}) async {
    try {
      DocumentSnapshot snapshot=   await firestore
          .collection(collectionName)
          .doc(uid)
          .get();
      print(snapshot.data());
      return NurseModel.fromMap(snapshot.data());

    } catch (e) {
      print('THis is the eerrroroor $e');
      return null;
    }
  }
  //============== Get Nutritionist Model data ====================

  Future<NutritionistModel> getNutritionistData({String collectionName, String uid}) async {
    try {
      DocumentSnapshot snapshot=   await firestore
          .collection(collectionName)
          .doc(uid)
          .get();
      print(snapshot.data());
      return NutritionistModel.fromMap(snapshot.data());

    } catch (e) {
      print('THis is the eerrroroor $e');
      return null;
    }
  }
  //============== Get LabModel data ====================

  Future<LabModel> getLabData({String collectionName, String uid}) async {
    try {
      DocumentSnapshot snapshot=   await firestore
          .collection(collectionName)
          .doc(uid)
          .get();
      print(snapshot.data());
      return LabModel.fromMap(snapshot.data());

    } catch (e) {
      print('THis is the eerrroroor $e');
      return null;
    }
  }
}
