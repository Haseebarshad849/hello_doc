import 'dart:convert';

import 'facilityModel.dart';

class HospitalModel {
  String id;
  String username;
  String address;
  String ptclNo;
  String phcRegNo;
  String contactPersonName;
  String contactPersonMobileNo;
  String about;
  Facility facilities;
  String imageUrl;

  HospitalModel({
    this.id,
    this.username='',
    this.address='',
    this.ptclNo='',
    this.phcRegNo='',
    this.contactPersonName='',
    this.contactPersonMobileNo='',
    this.about='',
    this.facilities,
     this.imageUrl='',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'address': address,
      'ptclNo': ptclNo,
      'phcRegNo': phcRegNo,
      'contactPersonName': contactPersonName,
      'contactPersonMobileNo': contactPersonMobileNo,
      'about': about,
      'facilities': facilities.toMap(),
      'imageUrl': imageUrl,
    };
  }

  factory HospitalModel.fromMap(Map<String, dynamic> map) {
    return HospitalModel(
      id: map['id'],
      username: map['username'],
      address: map['address'],
      ptclNo: map['ptclNo'],
      phcRegNo: map['phcRegNo'],
      contactPersonName: map['contactPersonName'],
      contactPersonMobileNo: map['contactPersonMobileNo'],
      about: map['about'],
      facilities: Facility.fromMap(map['facilities']),
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HospitalModel.fromJson(String source) => HospitalModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HospitalModel(id: $id, username: $username, address: $address, ptclNo: $ptclNo, phcRegNo: $phcRegNo, contactPersonName: $contactPersonName, contactPersonMobileNo: $contactPersonMobileNo, about: $about, facilities: $facilities, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HospitalModel &&
      other.id == id &&
      other.username == username &&
      other.address == address &&
      other.ptclNo == ptclNo &&
      other.phcRegNo == phcRegNo &&
      other.contactPersonName == contactPersonName &&
      other.contactPersonMobileNo == contactPersonMobileNo &&
      other.about == about &&
      other.facilities == facilities &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      username.hashCode ^
      address.hashCode ^
      ptclNo.hashCode ^
      phcRegNo.hashCode ^
      contactPersonName.hashCode ^
      contactPersonMobileNo.hashCode ^
      about.hashCode ^
      facilities.hashCode ^
      imageUrl.hashCode;
  }

}
