import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'response_body.dart';

class Data extends Equatable {
  final bool? error;
  final int? statusCode;
  final ResponseBody? responseBody;

  const Data({this.error, this.statusCode, this.responseBody});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        error: data['error'] as bool?,
        statusCode: data['statusCode'] as int?,
        responseBody: data['responseBody'] == null
            ? null
            : ResponseBody.fromMap(
                data['responseBody'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'error': error,
        'statusCode': statusCode,
        'responseBody': responseBody?.toMap(),
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
    bool? error,
    int? statusCode,
    ResponseBody? responseBody,
  }) {
    return Data(
      error: error ?? this.error,
      statusCode: statusCode ?? this.statusCode,
      responseBody: responseBody ?? this.responseBody,
    );
  }

  @override
  List<Object?> get props => [error, statusCode, responseBody];
}
