import 'package:oladoc/models/commonModel/availibilityDoc.dart';
import 'package:oladoc/models/commonModel/availibilityPersonalHomecare.dart';
import 'package:oladoc/models/commonModel/availibilityPrivateClinic.dart';
import 'package:oladoc/models/commonModel/avalibilityHospitalNames.dart';

class NutritionistModel {
  String id;
  String username;
  String mobileNo;
  String specialization;
  String summary;
  String fieldOfDoctrate;
  String education;
  AvailabilityDoc availablityDoc;
  String professionalMembership;
  String totalExperience;
  AvailibilityHospitalNames availibilityHospital;
  AvailibilityPrivateClinic availibiltyClinic;
  AvailibilityPersonalHomecare personalHomecare;
  String imageUrl;
  
  NutritionistModel({
    this.id,
    this.username='',
    this.mobileNo='',
    this.specialization='',
    this.summary='',
    this.fieldOfDoctrate='',
    this.education='',
    this.availablityDoc,
    this.professionalMembership='',
    this.totalExperience='',
    this.availibilityHospital,
    this.availibiltyClinic,
    this.personalHomecare,
    this.imageUrl='',
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'mobileNo': mobileNo,
      'specialization': specialization,
      'summary': summary,
      'fieldOfDoctrate': fieldOfDoctrate,
      'education': education,
      'availablityDoc': availablityDoc.toMap(),
      'professionalMembership': professionalMembership,
      'totalExperience': totalExperience,
      'availibilityHospital': availibilityHospital.toMap(),
      'availibiltyClinic': availibiltyClinic.toMap(),
      'personalHomecare': personalHomecare.toMap(),
      'imageUrl': imageUrl,
    };
  }

  factory NutritionistModel.fromMap(Map<String, dynamic> map) {
    return NutritionistModel(
      id: map['id'],
      username: map['username'],
      mobileNo: map['mobileNo'],
      specialization: map['specialization'],
      summary: map['summary'],
      fieldOfDoctrate: map['fieldOfDoctrate'],
      education: map['education'],
      availablityDoc: AvailabilityDoc.fromMap(map['availablityDoc']),
      professionalMembership: map['professionalMembership'],
      totalExperience: map['totalExperience'],
      availibilityHospital: AvailibilityHospitalNames.fromMap(map['availibilityHospital']),
      availibiltyClinic: AvailibilityPrivateClinic.fromMap(map['availibiltyClinic']),
      personalHomecare: AvailibilityPersonalHomecare.fromMap(map['personalHomecare']),
      imageUrl: map['imageUrl'],
    );
  }
}
