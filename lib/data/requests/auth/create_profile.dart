import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateProfile extends Equatable {
  final String? action;
  final String? firstName;
  final String? lastName;
  final String? fatherName;
  final String? motherName;
  final String? dob;
  final String? email;
  final String? gender;

  const CreateProfile({
    this.action,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.motherName,
    this.dob,
    this.email,
    this.gender,
  });

  factory CreateProfile.fromCreateProfile(Map<String, dynamic> data) {
    return CreateProfile(
      action: data['action'] as String?,
      firstName: data['first_name'] as String?,
      lastName: data['last_name'] as String?,
      fatherName: data['father_name'] as String?,
      motherName: data['mother_name'] as String?,
      dob: data['dob'] as String?,
      email: data['email'] as String?,
      gender: data['gender'] as String?,
    );
  }

  Map<String, dynamic> toCreateProfile() => {
        'action': action,
        'first_name': firstName,
        'last_name': lastName,
        'father_name': fatherName,
        'mother_name': motherName,
        'dob': dob,
        'email': email,
        'gender': gender,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateProfile].
  factory CreateProfile.fromJson(String data) {
    return CreateProfile.fromCreateProfile(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreateProfile] to a JSON string.
  String toJson() => json.encode(toCreateProfile());

  CreateProfile copyWith({
    String? action,
    String? firstName,
    String? lastName,
    String? fatherName,
    String? motherName,
    String? dob,
    String? email,
    String? gender,
  }) {
    return CreateProfile(
      action: action ?? this.action,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props {
    return [
      action,
      firstName,
      lastName,
      fatherName,
      motherName,
      dob,
      email,
      gender,
    ];
  }
}
