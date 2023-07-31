import 'dart:convert';

import 'package:equatable/equatable.dart';

class VerifyOtp extends Equatable {
  final int? otp;
  final int? uniqueId;

  const VerifyOtp({this.otp, this.uniqueId});

  factory VerifyOtp.fromMap(Map<String, dynamic> data) => VerifyOtp(
        otp: data['otp'] as int?,
        uniqueId: data['unique_id'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'otp': otp,
        'unique_id': uniqueId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VerifyOtp].
  factory VerifyOtp.fromJson(String data) {
    return VerifyOtp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VerifyOtp] to a JSON string.
  String toJson() => json.encode(toMap());

  VerifyOtp copyWith({
    int? otp,
    int? uniqueId,
  }) {
    return VerifyOtp(
      otp: otp ?? this.otp,
      uniqueId: uniqueId ?? this.uniqueId,
    );
  }

  @override
  List<Object?> get props => [otp, uniqueId];
}
