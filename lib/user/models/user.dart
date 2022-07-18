import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '/task/models/task.dart';
import '/task/views/task_list/task_list_model.dart';
import '/user/models/gender.dart';

part 'user_adapter.dart';
part 'user_provider.dart';

@HiveType(typeId: UserAdapter.id)
class User extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final Gender gender;

  @HiveField(5)
  final DateTime? birthday;

  @HiveField(6)
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.gender = Gender.other,
    this.birthday,
    this.phoneNumber,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, gender: $gender, birthday: $birthday, phoneNumber: $phoneNumber)';
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    Gender? gender,
    DateTime? birthday,
    String? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'gender': gender.name,
      'birthday': birthday?.millisecondsSinceEpoch,
      'phoneNumber': phoneNumber,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      gender: Gender.parseName(map['render'] as String),
      birthday: map['birthday'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthday'] as int)
          : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.gender == gender &&
        other.birthday == birthday &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        gender.hashCode ^
        birthday.hashCode ^
        phoneNumber.hashCode;
  }
}
