import './availablity.dart';

class AvailibilityPersonalHomecare extends Availibility {
  Availibility availibility;
  AvailibilityPersonalHomecare({
     this.availibility,
  });


  Map<String, dynamic> toMap() {
    return {
      'availibility': availibility.toMap(),
    };
  }

  factory AvailibilityPersonalHomecare.fromMap(Map<String, dynamic> map) {
    return AvailibilityPersonalHomecare(
      availibility: Availibility.fromMap(map['availibility']),
    );
  }
}
