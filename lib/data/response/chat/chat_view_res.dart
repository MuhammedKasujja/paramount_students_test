import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import './message.dart';

class ChatRes extends Equatable {
  final Either<Message, String>? message;
  final String? status;
  final bool? error;
  final int? statusCode;
  final String? responseBody;

  const ChatRes(
      {this.message,
      this.status,
      this.error,
      this.responseBody,
      this.statusCode});

  factory ChatRes.fromMap(Map<String, dynamic> data) => ChatRes(
      message: data['message'] == null
          ? null
          : data['message'] is List<dynamic>
              ? Left(Message.fromList(data['message'] as List<dynamic>))
              : Right(data['message'] as String),
      status: data['status'] as String?,
      error: data['error'] as bool?,
      statusCode: data['statusCode'] as int?,
      responseBody: data['responseBody'] as String?);

  Map<String, dynamic> toMap() => {
        'message': message,
        'status': status,
        'error': error,
        'status_code': statusCode,
        'response_body': responseBody
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChatRes].
  factory ChatRes.fromJson(String data) {
    return ChatRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChatRes] to a JSON string.
  String toJson() => json.encode(toMap());

  ChatRes copyWith(
      {Either<Message, String>? message,
      String? status,
      bool? error,
      int? statusCode,
      String? responseBody}) {
    return ChatRes(
        message: message ?? this.message,
        status: status ?? this.status,
        responseBody: responseBody ?? this.responseBody,
        error: error ?? this.error,
        statusCode: statusCode ?? this.statusCode);
  }

  @override
  List<Object?> get props => [message, status, error, responseBody, statusCode];
}
