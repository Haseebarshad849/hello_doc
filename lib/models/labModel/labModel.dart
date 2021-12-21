class LabModel {
  String id;
  String address;
  String ptclNo;
  String phcRegNo;
  String contactPersonName;
  String contactPersonMobileNo;
  String about;
  List<String> facilities;
  String homeFacilityContactName;
  String homeFacilityContactNo;
  String imageUrl;
  
  LabModel({
    this.id,
    this.address,
    this.ptclNo,
    this.phcRegNo,
    this.contactPersonName,
    this.contactPersonMobileNo,
    this.about,
    this.facilities,
    this.homeFacilityContactName,
    this.homeFacilityContactNo,
    this.imageUrl='',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'ptclNo': ptclNo,
      'phcRegNo': phcRegNo,
      'contactPersonName': contactPersonName,
      'contactPersonMobileNo': contactPersonMobileNo,
      'about': about,
      'facilities': facilities,
      'homeFacilityContactName': homeFacilityContactName,
      'homeFacilityContactNo': homeFacilityContactNo,
      'imageUrl': imageUrl,
    };
  }

  factory LabModel.fromMap(Map<String, dynamic> map) {
    return LabModel(
      id: map['id'],
      address: map['address'],
      ptclNo: map['ptclNo'],
      phcRegNo: map['phcRegNo'],
      contactPersonName: map['contactPersonName'],
      contactPersonMobileNo: map['contactPersonMobileNo'],
      about: map['about'],
      facilities: List<String>.from(map['facilities']),
      homeFacilityContactName: map['homeFacilityContactName'],
      homeFacilityContactNo: map['homeFacilityContactNo'],
      imageUrl: map['imageUrl'],
    );
  }
}