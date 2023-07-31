import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class RegisterProfileRes extends Equatable {
  final String? message;
  final Data? data;

  const RegisterProfileRes({this.message, this.data});

  factory RegisterProfileRes.fromMap(Map<String, dynamic> data) {
    return RegisterProfileRes(
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegisterProfileRes].
  factory RegisterProfileRes.fromJson(String data) {
    return RegisterProfileRes.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RegisterProfileRes] to a JSON string.
  String toJson() => json.encode(toMap());

  RegisterProfileRes copyWith({
    String? message,
    Data? data,
  }) {
    return RegisterProfileRes(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [message, data];
}
