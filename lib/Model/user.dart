// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyUser {
  final String id;
  final String name;
  final String password;
  final String address;
  final String phone;
  final String email;
  final bool isMale;
  final int type;
  final int rate;

  MyUser({
    required this.id,
    required this.name,
    required this.password,
    required this.address,
    required this.phone,
    required this.email,
    required this.isMale,
    required this.type,
    required this.rate,
  });

  MyUser copyWith({
    String? id,
    String? name,
    String? password,
    String? address,
    String? phone,
    String? email,
    bool? isMale,
    int? type,
    int? rate,
  }) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      isMale: isMale ?? this.isMale,
      type: type ?? this.type,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'address': address,
      'phone': phone,
      'email': email,
      'isMale': isMale,
      'type': type,
      'rate': rate,
    };
  }

  factory MyUser.fromMap(Map<String, dynamic> map) {
    return MyUser(
      id: map['id'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      isMale: map['isMale'] as bool,
      type: map['type'] as int,
      rate: map['rate'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyUser.fromJson(String source) => MyUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyUser(id: $id, name: $name, password: $password, address: $address, phone: $phone, email: $email, isMale: $isMale, type: $type, rate: $rate)';
  }

  @override
  bool operator ==(covariant MyUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.password == password &&
        other.address == address &&
        other.phone == phone &&
        other.email == email &&
        other.isMale == isMale &&
        other.type == type &&
        other.rate == rate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        password.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        isMale.hashCode ^
        type.hashCode ^
        rate.hashCode;
  }
}
