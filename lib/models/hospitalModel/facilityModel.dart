import 'dart:convert';

import 'package:flutter/foundation.dart';

class Facility {
  List<String> facility;
  Facility({
    this.facility,
  });

  Facility copyWith({
    List<String> facility,
  }) {
    return Facility(
      facility: facility ?? this.facility,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'facility': facility,
    };
  }

  factory Facility.fromMap(Map<String, dynamic> map) {
    return Facility(
      facility: List<String>.from(map['facility']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Facility.fromJson(String source) => Facility.fromMap(json.decode(source));

  @override
  String toString() => 'Facility(facility: $facility)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Facility &&
      listEquals(other.facility, facility);
  }

  @override
  int get hashCode => facility.hashCode;
}
