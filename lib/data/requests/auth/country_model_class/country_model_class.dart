import 'dart:convert';

import 'package:equatable/equatable.dart';

class CountryModelClass extends Equatable {
  final int? id;
  final String? shortName;
  final String? name;
  final int? phoneCode;
  final dynamic createdAt;
  final dynamic updatedAt;

  const CountryModelClass({
    this.id,
    this.shortName,
    this.name,
    this.phoneCode,
    this.createdAt,
    this.updatedAt,
  });

  factory CountryModelClass.fromMap(Map<String, dynamic> data) {
    return CountryModelClass(
      id: data['id'] as int?,
      shortName: data['short_name'] as String?,
      name: data['name'] as String?,
      phoneCode: data['phone_code'] as int?,
      createdAt: data['created_at'] as dynamic,
      updatedAt: data['updated_at'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'short_name': shortName,
        'name': name,
        'phone_code': phoneCode,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryModelClass].
  factory CountryModelClass.fromJson(String data) {
    return CountryModelClass.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CountryModelClass] to a JSON string.
  String toJson() => json.encode(toMap());

  CountryModelClass copyWith({
    int? id,
    String? shortName,
    String? name,
    int? phoneCode,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    return CountryModelClass(
      id: id ?? this.id,
      shortName: shortName ?? this.shortName,
      name: name ?? this.name,
      phoneCode: phoneCode ?? this.phoneCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      shortName,
      name,
      phoneCode,
      createdAt,
      updatedAt,
    ];
  }
}
