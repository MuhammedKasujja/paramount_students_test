import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'passport_info.dart';

class Contact extends Equatable {
  final dynamic phone;
  final String? citizen;
  final String? countryResidence;
  final String? cityRegion;
  final String? homeAddress;
  final String? postalCode;
  final PassportInfo? passportInfo;

  const Contact(
      {this.phone,
      this.citizen,
      this.countryResidence,
      this.cityRegion,
      this.homeAddress,
      this.postalCode,
      this.passportInfo});

  factory Contact.fromMap(Map<String, dynamic> data) => Contact(
        phone: data['phone'] as String?,
        citizen: data['citizen'] as String?,
        countryResidence: data['country_residence'] as String?,
        cityRegion: data['city_region'] as String?,
        homeAddress: data['home_address'] as String?,
        postalCode: data['postal_code'] as String?,
        passportInfo: data['passport_info'] != null
            ? PassportInfo.fromMap(data['passport_info'])
            : null,
      );

  Map<String, dynamic> toMap() => {
        'phone': phone,
        'citizen': citizen,
        'country_residence': countryResidence,
        'city_region': cityRegion,
        'home_address': homeAddress,
        'postal_code': postalCode,
        'passport_info': passportInfo?.toMap()
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Contact].
  factory Contact.fromJson(String data) {
    return Contact.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Contact] to a JSON string.
  String toJson() => json.encode(toMap());

  Contact copyWith(
      {dynamic phone,
      String? citizen,
      String? countryResidence,
      String? cityRegion,
      String? homeAddress,
      String? postalCode,
      PassportInfo? passportInfo}) {
    return Contact(
      phone: phone ?? this.phone,
      citizen: citizen ?? this.citizen,
      countryResidence: countryResidence ?? this.countryResidence,
      cityRegion: cityRegion ?? this.cityRegion,
      homeAddress: homeAddress ?? this.homeAddress,
      postalCode: postalCode ?? this.postalCode,
      passportInfo: passportInfo ?? this.passportInfo,
    );
  }

  @override
  List<Object?> get props {
    return [
      phone,
      citizen,
      countryResidence,
      cityRegion,
      homeAddress,
      postalCode,
      passportInfo
    ];
  }
}
