class PersonModel {
   String id;
   String name;
   String email;
   String password;
   String type;
  PersonModel({
     this.id,
     this.name,
     this.email,
     this.password,
    this.type,
  });



  PersonModel copyWith({
    String id,
    String name,
    String email,
    String password,
    String type,
  }) {
    return PersonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'type': type,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      type: map['type'],
    );
  }
}
