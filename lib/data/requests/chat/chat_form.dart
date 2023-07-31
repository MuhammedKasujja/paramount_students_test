import 'dart:convert';
import 'package:equatable/equatable.dart';

class ChatFormModel extends Equatable {
  final String? message;
  final int? receiverId;
  final String? receiverType;
  final dynamic chatCode;

  const ChatFormModel({
    this.message,
    this.receiverId,
    this.receiverType,
    this.chatCode
  });

  factory ChatFormModel.fromMap(Map<String, dynamic> data) {
    return ChatFormModel(
      message: data['message'] as String?,
      receiverId: data['receiver_id'] as int?,
      receiverType: data['receiver_type'] as String?,
      chatCode: data['chat_code']
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'receiver_id': receiverId,
        'receiver_type': receiverType,
        'chat_code': chatCode
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChatFormModel].
  factory ChatFormModel.fromJson(String data) {
    return ChatFormModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChatFormModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ChatFormModel copyEducationWith({
    String? message,
    int? receiverId,
    String? receiverType,
    dynamic chatCode
  }) {
    return ChatFormModel(
      message: message ?? this.message,
      receiverId: receiverId ?? this.receiverId,
      receiverType: receiverType ?? this.receiverType,
      chatCode: chatCode ?? this.chatCode
    );
  }

  @override
  List<Object?> get props {
    return [
      message,
      receiverId,
      receiverType,
      chatCode
    ];
  }
}
