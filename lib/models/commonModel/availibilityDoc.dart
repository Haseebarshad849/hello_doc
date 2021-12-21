import './availablity.dart';

class AvailabilityDoc extends Availibility {
  Availibility availibility;
  String waitTime;
  AvailabilityDoc({
     this.availibility,
     this.waitTime,
  });

 
  Map<String, dynamic> toMap() {
    return {
      'availibility':this.availibility?.toMap(),
      'waitTime': waitTime,
    };
  }

  factory AvailabilityDoc.fromMap(Map<String, dynamic> map) {
    return AvailabilityDoc(
      availibility: Availibility.fromMap(map['availibility']),
      waitTime: map['waitTime']??'',
    );
  }

}
