import 'package:oladoc/models/commonModel/timingModel.dart';

class NurseModel {
  String id;
  String userName;
  String fatherName;
  String address;
  String email;
  String mobileNo;
  String cnic;
  String hospitalName;
  String nursingField;
  List<TimingModel> timingModel;
  bool isAvailable;
  String education;
  int registrationNo;
  String bankName;
  int bankAccountNo;
  int feePerHour;
  int feePerWeek;
  int feePerMonth;
  String imageUrl;

  NurseModel({
    this.id,
    this.userName,
    this.fatherName,
    this.address,
    this.email,
    this.mobileNo,
    this.cnic,
    this.hospitalName,
    this.nursingField,
    this.timingModel,
    this.isAvailable=false,
    this.education,
    this.registrationNo,
     this.bankName,
     this.bankAccountNo,
    this.feePerHour,
    this.feePerWeek,
    this.feePerMonth,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'fatherName': fatherName,
      'address': address,
      'email': email,
      'mobileNo': mobileNo,
      'cnic': cnic,
      'hospitalName': hospitalName,
      'nursingField': nursingField,
      'timingModel': timingModel?.map((x) => x.toMap())?.toList(),
      'isAvailable': isAvailable,
      'education': education,
      'registrationNo': registrationNo,
      'bankName': bankName,
      'bankAccountNo': bankAccountNo,
      'feePerHour': feePerHour,
      'feePerWeek': feePerWeek,
      'feePerMonth': feePerMonth,
      'imageUrl': imageUrl,
    };
  }

  factory NurseModel.fromMap(Map<String, dynamic> map) {
    return NurseModel(
      id: map['id'],
      userName: map['userName'],
      fatherName: map['fatherName'],
      address: map['address'],
      email: map['email'],
      mobileNo: map['mobileNo'],
      cnic: map['cnic'],
      hospitalName: map['hospitalName'],
      nursingField: map['nursingField'],
      timingModel: List<TimingModel>.from(map['timingModel']?.map((x) => TimingModel.fromMap(x))),
      isAvailable: map['isAvailable'],
      education: map['education'],
      registrationNo: map['registrationNo'],
      bankName: map['bankName'],
      bankAccountNo: map['bankAccountNo'],
      feePerHour: map['feePerHour'],
      feePerWeek: map['feePerWeek'],
      feePerMonth: map['feePerMonth'],
      imageUrl: map['imageUrl'],
    );
  }
}
