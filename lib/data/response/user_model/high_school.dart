import 'dart:convert';

import 'package:equatable/equatable.dart';

class HighSchool extends Equatable {
  final int? id;
  final String? name;
  final String? uniqueId;
  final String? type;
  final String? email;
  final String? phone;
  final String? registeredDate;
  final String? address;
  final String? countryId;
  final dynamic stateId;
  final String? postalCode;
  final String? coverPhotoUrl;
  final String? active;
  final String? verification;
  final dynamic createdAt;
  final dynamic updatedAt;
  final String? country;
  final dynamic city;

  const HighSchool({
    this.id,
    this.name,
    this.uniqueId,
    this.type,
    this.email,
    this.phone,
    this.registeredDate,
    this.address,
    this.countryId,
    this.stateId,
    this.postalCode,
    this.coverPhotoUrl,
    this.active,
    this.verification,
    this.createdAt,
    this.updatedAt,
    this.country,
    this.city,
  });

  factory HighSchool.fromMap(Map<String, dynamic> data) => HighSchool(
        id: data['id'] as int?,
        name: data['name'] as String?,
        uniqueId: data['unique_id'] as String?,
        type: data['type'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as dynamic,
        registeredDate: data['registered_date'] as String?,
        address: data['address'] as String?,
        countryId: data['country_id'] as String?,
        stateId: data['state_id'] as dynamic,
        postalCode: data['postal_code'] as String?,
        coverPhotoUrl: data['cover_photo_url'] as String?,
        active: data['active'] as String?,
        verification: data['verification'] as String?,
        createdAt: data['created_at'] as dynamic,
        updatedAt: data['updated_at'] as dynamic,
        country: data['country'] as String?,
        city: data['city'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'unique_id': uniqueId,
        'type': type,
        'email': email,
        'phone': phone,
        'registered_date': registeredDate,
        'address': address,
        'country_id': countryId,
        'state_id': stateId,
        'postal_code': postalCode,
        'cover_photo_url': coverPhotoUrl,
        'active': active,
        'verification': verification,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'country': country,
        'city': city,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HighSchool].
  factory HighSchool.fromJson(String data) {
    return HighSchool.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HighSchool] to a JSON string.
  String toJson() => json.encode(toMap());

  HighSchool copyWith({
    int? id,
    String? name,
    String? uniqueId,
    String? type,
    String? email,
    dynamic phone,
    String? registeredDate,
    String? address,
    String? countryId,
    dynamic stateId,
    String? postalCode,
    String? coverPhotoUrl,
    String? active,
    String? verification,
    dynamic createdAt,
    dynamic updatedAt,
    String? country,
    dynamic city,
  }) {
    return HighSchool(
      id: id ?? this.id,
      name: name ?? this.name,
      uniqueId: uniqueId ?? this.uniqueId,
      type: type ?? this.type,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      registeredDate: registeredDate ?? this.registeredDate,
      address: address ?? this.address,
      countryId: countryId ?? this.countryId,
      stateId: stateId ?? this.stateId,
      postalCode: postalCode ?? this.postalCode,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      active: active ?? this.active,
      verification: verification ?? this.verification,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      country: country ?? this.country,
      city: city ?? this.city,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      uniqueId,
      type,
      email,
      phone,
      registeredDate,
      address,
      countryId,
      stateId,
      postalCode,
      coverPhotoUrl,
      active,
      verification,
      createdAt,
      updatedAt,
      country,
      city,
    ];
  }
}
