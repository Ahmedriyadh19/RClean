
import 'dart:convert';

class Admin {
  final String id;
  final String name;
  final String email;
  final String password;
  final String? urlPicture;
  Admin({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.urlPicture,
  });

  Admin copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? urlPicture,
  }) {
    return Admin(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      urlPicture: urlPicture ?? this.urlPicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'urlPicture': urlPicture,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      urlPicture: map['urlPicture'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Admin(id: $id, name: $name, email: $email, password: $password, urlPicture: $urlPicture)';
  }

  @override
  bool operator ==(covariant Admin other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.email == email && other.password == password && other.urlPicture == urlPicture;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode ^ urlPicture.hashCode;
  }
}
