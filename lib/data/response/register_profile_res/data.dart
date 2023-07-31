import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final int? userId;
  final String? uniqueId;
  final String? fullName;
  final String? lastName;
  final String? firstName;

  const Data({
    this.userId,
    this.uniqueId,
    this.fullName,
    this.lastName,
    this.firstName,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        userId: data['user_id'] as int?,
        uniqueId: data['unique_id'] as String?,
        fullName: data['full_name'] as String?,
        lastName: data['last_name'] as String?,
        firstName: data['first_name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'unique_id': uniqueId,
        'full_name': fullName,
        'last_name': lastName,
        'first_name': firstName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    int? userId,
    String? uniqueId,
    String? fullName,
    String? lastName,
    String? firstName,
  }) {
    return Data(
      userId: userId ?? this.userId,
      uniqueId: uniqueId ?? this.uniqueId,
      fullName: fullName ?? this.fullName,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
    );
  }

  @override
  List<Object?> get props {
    return [
      userId,
      uniqueId,
      fullName,
      lastName,
      firstName,
    ];
  }
}
