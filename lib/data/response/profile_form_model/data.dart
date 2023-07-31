import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final dynamic userId;

  final String? uniqueId;

  final String? fullName;
  final String? lastName;
  final String? firstName;

  const Data(
      {this.userId,
      this.uniqueId,
      this.fullName,
      this.firstName,
      this.lastName});

  factory Data.fromProfileFormModel(Map<String, dynamic> data) => Data(
        userId: data['user_id'] as dynamic,
        uniqueId: data['unique_id'] as dynamic,
        fullName: data['full_name'] as String?,
        lastName: data['last_name'] as String?,
        firstName: data['first_name'] as String?,
      );

  Map<String, dynamic> toProfileFormModel() => {
        'user_id': userId,
        'unique_id': uniqueId,
        'full_name': fullName,
        'last_name': lastName,
        'first_name': firstName
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromProfileFormModel(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toProfileFormModel());

  Data copyWith({
    dynamic userId,
    String? uniqueId,
    String? fullName,
  }) {
    return Data(
        userId: userId ?? this.userId,
        uniqueId: uniqueId ?? this.uniqueId,
        fullName: fullName ?? this.fullName);
  }

  @override
  List<Object?> get props => [userId];
}
