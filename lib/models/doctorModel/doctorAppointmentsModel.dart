import 'dart:convert';

import 'package:oladoc/models/commonModel/timingModel.dart';

class DoctorAppointmentModel {
  String id;
  String patientId;
  String patientName;
  String doctorName;
  TimingModel timingModel;
  String address;
  String fee;
  DateTime date;

  DoctorAppointmentModel({
    this.id,
    this.patientId,
    this.patientName,
    this.doctorName,
    this.timingModel,
    this.address,
    this.fee,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patientId': patientId,
      'patientName': patientName,
      'doctorName': doctorName,
      'timingModel': timingModel.toMap(),
      'address': address,
      'fee': fee,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory DoctorAppointmentModel.fromMap(Map<String, dynamic> map) {
    return DoctorAppointmentModel(
      id: map['id'],
      patientId: map['patientId'],
      patientName: map['patientName'],
      doctorName: map['doctorName'],
      timingModel: TimingModel.fromMap(map['timingModel']),
      address: map['address'],
      fee: map['fee'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorAppointmentModel.fromJson(String source) => DoctorAppointmentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DoctorAppointmentModel(id: $id, patientId: $patientId, patientName: $patientName, doctorName: $doctorName, timingModel: $timingModel, address: $address, fee: $fee, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DoctorAppointmentModel &&
      other.id == id &&
      other.patientId == patientId &&
      other.patientName == patientName &&
      other.doctorName == doctorName &&
      other.timingModel == timingModel &&
      other.address == address &&
      other.fee == fee &&
      other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      patientId.hashCode ^
      patientName.hashCode ^
      doctorName.hashCode ^
      timingModel.hashCode ^
      address.hashCode ^
      fee.hashCode ^
      date.hashCode;
  }
}
