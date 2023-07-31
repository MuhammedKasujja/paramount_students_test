import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProgramAppRes extends Equatable {
  final bool? error;
  final int? statusCode;
  final String? responseBody;

  const ProgramAppRes({this.error, this.statusCode, this.responseBody});

  factory ProgramAppRes.fromMap(Map<String, dynamic> data) => ProgramAppRes(
        error: data['error'] as bool?,
        statusCode: data['statusCode'] as int?,
        responseBody: data['responseBody'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'error': error,
        'statusCode': statusCode,
        'responseBody': responseBody,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProgramAppRes].
  factory ProgramAppRes.fromJson(String data) {
    return ProgramAppRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProgramAppRes] to a JSON string.
  String toJson() => json.encode(toMap());

  ProgramAppRes copyWith({
    bool? error,
    int? statusCode,
    String? responseBody,
  }) {
    return ProgramAppRes(
      error: error ?? this.error,
      statusCode: statusCode ?? this.statusCode,
      responseBody: responseBody ?? this.responseBody,
    );
  }

  @override
  List<Object?> get props => [error, statusCode, responseBody];
}
