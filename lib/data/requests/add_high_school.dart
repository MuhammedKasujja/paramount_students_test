import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddHighSchool extends Equatable {
  final String? name;
  final int? stateId;
  final int? countryId;
  final String? address;
  final int? postalCode;

  const AddHighSchool({
    this.name,
    this.stateId,
    this.countryId,
    this.address,
    this.postalCode,
  });

  factory AddHighSchool.fromMap(Map<String, dynamic> data) => AddHighSchool(
        name: data['name'] as String?,
        stateId: data['state_id'] as int?,
        countryId: data['country_id'] as int?,
        address: data['address'] as String?,
        postalCode: data['postal_code'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'state_id': stateId,
        'country_id': countryId,
        'address': address,
        'postal_code': postalCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddHighSchool].
  factory AddHighSchool.fromJson(String data) {
    return AddHighSchool.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddHighSchool] to a JSON string.
  String toJson() => json.encode(toMap());

  AddHighSchool copyWith({
    String? name,
    int? stateId,
    int? countryId,
    String? address,
    int? postalCode,
  }) {
    return AddHighSchool(
      name: name ?? this.name,
      stateId: stateId ?? this.stateId,
      countryId: countryId ?? this.countryId,
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      stateId,
      countryId,
      address,
      postalCode,
    ];
  }
}
