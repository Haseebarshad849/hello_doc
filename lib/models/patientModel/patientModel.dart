class PatientModel {
  String id;
  String username;
  String address;
  String mobileNo;
  String occupation;
  String cnic;
  String imageUrl;

  PatientModel({
    this.id,
    this.username,
    this.address,
    this.mobileNo,
    this.occupation,
    this.cnic,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'address': address,
      'mobileNo': mobileNo,
      'occupation': occupation,
      'cnic': cnic,
      'imageUrl': imageUrl,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      id: map['id'],
      username: map['username'],
      address: map['address'],
      mobileNo: map['mobileNo'],
      occupation: map['occupation'],
      cnic: map['cnic'],
      imageUrl: map['imageUrl'],
    );
  }
}