import './availablity.dart';

class AvailibilityPrivateClinic {
  Availibility availibility;
  String address;
  String clinicName;
  AvailibilityPrivateClinic({
     this.availibility,
     this.address,
     this.clinicName,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'availibility': availibility.toMap(),
      'address': address,
      'clinicName': clinicName,
    };
  }

  factory AvailibilityPrivateClinic.fromMap(Map<String, dynamic> map) {
    return AvailibilityPrivateClinic(
      availibility: Availibility.fromMap(map['availibility']),
      address: map['address']??'',
      clinicName: map['clinicName']??'',
    );
  }
}
