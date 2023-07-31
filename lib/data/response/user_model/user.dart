import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'contact.dart';
import 'document.dart';
import 'education.dart';
import 'high_school.dart';

class User extends Equatable {
  final int? id;
  final String? uniqueId;
  final int? highSchoolId;
  final BigInt? walletNumber;
  final String? firstName;
  final String? lastName;
  final String? fatherName;
  final String? motherName;
  final String? dob;
  final String? email;
  final String? gender;
  final dynamic phone;
  final dynamic pictureUrl;
  final dynamic applicationStatus;
  final String? comment;
  final int? active;
  final dynamic registeredDate;
  final dynamic otpExpire;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? country;
  final dynamic trackingStatus;
  final dynamic nationalId;
  final String? homeAddress;
  final String? postalCode;
  final String? city;
  final Education? education;
  final Contact? contact;
  final Document? document;
  final String? fullName;
  final HighSchool? highSchool;
  final String? userType;

  const User({
    this.id,
    this.uniqueId,
    this.highSchoolId,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.motherName,
    this.dob,
    this.email,
    this.gender,
    this.phone,
    this.pictureUrl,
    this.applicationStatus,
    this.comment,
    this.active,
    this.walletNumber,
    this.registeredDate,
    this.otpExpire,
    this.createdAt,
    this.updatedAt,
    this.country,
    this.trackingStatus,
    this.nationalId,
    this.homeAddress,
    this.postalCode,
    this.city,
    this.education,
    this.contact,
    this.document,
    this.fullName,
    this.highSchool,
    this.userType,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        uniqueId: data['unique_id'] as String?,
        highSchoolId: data['high_school_id'] as int?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        fatherName: data['father_name'] as String?,
        motherName: data['mother_name'] as String?,
        dob: data['dob'] as String?,
        email: data['email'] as String?,
        gender: data['gender'] as String?,
        phone: data['phone'] as dynamic,
        walletNumber: data['wallet_number'] as BigInt?,
        pictureUrl: data['picture_url'] as dynamic,
        applicationStatus: data['application_status'] as dynamic,
        comment: data['comment'] as String?,
        active: data['active'] as int?,
        registeredDate: data['registered_date'] as dynamic,
        otpExpire: data['otp_expire'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        country: data['country'] as String?,
        trackingStatus: data['tracking_status'] as dynamic,
        nationalId: data['national_id'] as dynamic,
        homeAddress: data['home_address'] as String?,
        postalCode: data['postal_code'] as String?,
        city: data['city'] as String?,
        education: data['education'] == null
            ? null
            : Education.fromMap(data['education'] as Map<String, dynamic>),
        contact: data['contact'] == null
            ? null
            : Contact.fromMap(data['contact'] as Map<String, dynamic>),
        document: data['document'] == null
            ? null
            : Document.fromMap(data['document'] as Map<String, dynamic>),
        fullName: data['full_name'] as String?,
        highSchool: data['high_school'] == null
            ? null
            : HighSchool.fromMap(data['high_school'] as Map<String, dynamic>),
        userType: data['user_type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'unique_id': uniqueId,
        'high_school_id': highSchoolId,
        'first_name': firstName,
        'last_name': lastName,
        'father_name': fatherName,
        'mother_name': motherName,
        'dob': dob,
        'email': email,
        'gender': gender,
        'wallet_number': walletNumber,
        'phone': phone,
        'picture_url': pictureUrl,
        'application_status': applicationStatus,
        'comment': comment,
        'active': active,
        'registered_date': registeredDate,
        'otp_expire': otpExpire,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'country': country,
        'tracking_status': trackingStatus,
        'national_id': nationalId,
        'home_address': homeAddress,
        'postal_code': postalCode,
        'city': city,
        'education': education?.toMap(),
        'contact': contact?.toMap(),
        'document': document?.toMap(),
        'full_name': fullName,
        'high_school': highSchool?.toMap(),
        'user_type': userType,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    int? id,
    String? uniqueId,
    int? highSchoolId,
    String? firstName,
    String? lastName,
    String? fatherName,
    String? motherName,
    String? dob,
    String? email,
    String? gender,
    BigInt? walletNumber,
    dynamic phone,
    dynamic pictureUrl,
    dynamic applicationStatus,
    String? comment,
    int? active,
    dynamic registeredDate,
    dynamic otpExpire,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? country,
    dynamic trackingStatus,
    dynamic nationalId,
    String? homeAddress,
    String? postalCode,
    String? city,
    Education? education,
    Contact? contact,
    Document? document,
    String? fullName,
    HighSchool? highSchool,
    String? userType,
  }) {
    return User(
      id: id ?? this.id,
      uniqueId: uniqueId ?? this.uniqueId,
      highSchoolId: highSchoolId ?? this.highSchoolId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      applicationStatus: applicationStatus ?? this.applicationStatus,
      comment: comment ?? this.comment,
      active: active ?? this.active,
      registeredDate: registeredDate ?? this.registeredDate,
      otpExpire: otpExpire ?? this.otpExpire,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      country: country ?? this.country,
      trackingStatus: trackingStatus ?? this.trackingStatus,
      nationalId: nationalId ?? this.nationalId,
      homeAddress: homeAddress ?? this.homeAddress,
      postalCode: postalCode ?? this.postalCode,
      walletNumber: walletNumber ?? this.walletNumber,
      city: city ?? this.city,
      education: education ?? this.education,
      contact: contact ?? this.contact,
      document: document ?? this.document,
      fullName: fullName ?? this.fullName,
      highSchool: highSchool ?? this.highSchool,
      userType: userType ?? this.userType,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      uniqueId,
      highSchoolId,
      firstName,
      lastName,
      fatherName,
      motherName,
      dob,
      email,
      gender,
      phone,
      pictureUrl,
      walletNumber,
      applicationStatus,
      comment,
      active,
      registeredDate,
      otpExpire,
      createdAt,
      updatedAt,
      country,
      trackingStatus,
      nationalId,
      homeAddress,
      postalCode,
      city,
      education,
      contact,
      document,
      fullName,
      highSchool,
      userType,
    ];
  }
}
