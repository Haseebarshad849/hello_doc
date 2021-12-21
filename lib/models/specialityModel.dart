import 'dart:convert';

class SpecialityModel {
   String id;
   String image;
   String title;
  SpecialityModel({
     this.id,
     this.image,
     this.title,
  });

  SpecialityModel copyWith({
    String id,
    String image,
    String title,
  }) {
    return SpecialityModel(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
    };
  }

  factory SpecialityModel.fromMap(Map<String, dynamic> map) {
    return SpecialityModel(
      id: map['id']??'',
      image: map['image'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialityModel.fromJson(String source) => SpecialityModel.fromMap(json.decode(source));

  @override
  String toString() => 'SpecialityModel(id: $id, image: $image, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SpecialityModel &&
      other.id == id &&
      other.image == image &&
      other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode ^ title.hashCode;
}
