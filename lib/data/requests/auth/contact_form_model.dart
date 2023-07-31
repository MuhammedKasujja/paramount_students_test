import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContactFormModel extends Equatable {
  final String? action;
  final int? userId;
  final String? phone;
  final String? citizen;
  final String? countryResidence;
  final String? cityRegion;
  final String? homeAddress;
  final String? passport;
  final String? issueDate;
  final String? expiryDate;
  final String? countryLocalId;

  const ContactFormModel({
    this.action,
    this.userId,
    this.phone,
    this.citizen,
    this.countryResidence,
    this.cityRegion,
    this.homeAddress,
    this.passport,
    this.issueDate,
    this.expiryDate,
    this.countryLocalId,
  });

  factory ContactFormModel.fromMap(Map<String, dynamic> data) {
    return ContactFormModel(
      action: data['action'] as String?,
      userId: data['user_id'] as int?,
      phone: data['phone'] as String?,
      citizen: data['citizen'] as String?,
      countryResidence: data['country_residence'] as String?,
      cityRegion: data['city_region'] as String?,
      homeAddress: data['home_address'] as String?,
      passport: data['passport'] as String?,
      issueDate: data['issue_date'] as String?,
      expiryDate: data['expiry_date'] as String?,
      countryLocalId: data['country_local_id'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'action': action,
        'user_id': userId,
        'phone': phone,
        'citizen': citizen,
        'country_residence': countryResidence,
        'city_region': cityRegion,
        'home_address': homeAddress,
        'passport': passport,
        'issue_date': issueDate,
        'expiry_date': expiryDate,
        'country_local_id': countryLocalId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ContactFormModel].
  factory ContactFormModel.fromJson(String data) {
    return ContactFormModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ContactFormModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ContactFormModel copyContactWith({
    String? action,
    int? userId,
    String? phone,
    String? citizen,
    String? countryResidence,
    String? cityRegion,
    String? homeAddress,
    String? passport,
    String? issueDate,
    String? expiryDate,
    String? countryLocalId,
  }) {
    return ContactFormModel(
      action: action ?? this.action,
      userId: userId ?? this.userId,
      phone: phone ?? this.phone,
      citizen: citizen ?? this.citizen,
      countryResidence: countryResidence ?? this.countryResidence,
      cityRegion: cityRegion ?? this.cityRegion,
      homeAddress: homeAddress ?? this.homeAddress,
      passport: passport ?? this.passport,
      issueDate: issueDate ?? this.issueDate,
      expiryDate: expiryDate ?? this.expiryDate,
      countryLocalId: countryLocalId ?? this.countryLocalId,
    );
  }

  @override
  List<Object?> get props {
    return [
      action,
      userId,
      phone,
      citizen,
      countryResidence,
      cityRegion,
      homeAddress,
      passport,
      issueDate,
      expiryDate,
      countryLocalId,
    ];
  }
}
