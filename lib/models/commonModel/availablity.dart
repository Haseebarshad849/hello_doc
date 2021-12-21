import './timingModel.dart';

class Availibility {
  List<TimingModel> timing=[];
  String fee;
  bool isAvailable;
  Availibility({
     this.timing,
     this.fee='',
     this.isAvailable=false,
  });
  


  Map<String, dynamic> toMap() {
    return {
      'timing': timing?.map((x) => x.toMap())?.toList(),
      'fee': fee,
      'isAvailable': isAvailable,
    };
  }

  factory Availibility.fromMap(Map<String, dynamic> map) {
    return Availibility(
      timing: List<TimingModel>.from(map['timing']?.map((x) => TimingModel.fromMap(x))),
      fee: map['fee']??'',
      isAvailable: map['isAvailable']??'',
    );
  }
}
