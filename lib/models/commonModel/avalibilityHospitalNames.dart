import 'package:oladoc/models/commonModel/availablity.dart';

class AvailibilityHospitalNames{
  Availibility availibility;
  String address;
  String hospitalName;
  
  AvailibilityHospitalNames({
    this.availibility,
    this.address='',
    this.hospitalName='',
  });

  Map<String, dynamic> toMap() {
    return {
      'availibility': availibility.toMap(),
      'address': address,
      'hospitalName': hospitalName,
    };
  }

  factory AvailibilityHospitalNames.fromMap(Map<String, dynamic> map) {
    return AvailibilityHospitalNames(
      availibility: Availibility.fromMap(map['availibility']),
      address: map['address']??'',
      hospitalName: map['hospitalName']??'',
    );
  }
}
