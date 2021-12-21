class TimingModel {
  String day;
  String from;
  String end;
  TimingModel({
     this.day='',
     this.from='',
     this.end='',
  });

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'from': from,
      'end': end,
    };
  }

  factory TimingModel.fromMap(Map<String, dynamic> map) {
    return TimingModel(
      day: map['day']??'',
      from: map['from']??'',
      end: map['end']??'',
    );
  }

}
