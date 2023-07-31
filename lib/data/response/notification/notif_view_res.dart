import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import './notif_message.dart';

class NotifRes extends Equatable {
  final Either<Message, String>? message;
  final int? totalUnread;

  const NotifRes({this.message, this.totalUnread});

  factory NotifRes.fromMap(Map<String, dynamic> data) => NotifRes(
      message: data['message'] == null
          ? null
          : data['message'] is String
              ? Right(data['message'])
              : Left(Message.fromMap(data['message'] as Map<String, dynamic>)),
      totalUnread: data['total_unread'] as int?);

  Map<String, dynamic> toMap() =>
      {'message': message, 'total_unread': totalUnread};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NotifRes].
  factory NotifRes.fromJson(String data) {
    return NotifRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NotifRes] to a JSON string.
  String toJson() => json.encode(toMap());

  NotifRes copyWith({Either<Message, String>? message, int? totalUnread}) {
    return NotifRes(
        message: message ?? this.message,
        totalUnread: totalUnread ?? this.totalUnread);
  }

  @override
  List<Object?> get props => [message, totalUnread];
}
