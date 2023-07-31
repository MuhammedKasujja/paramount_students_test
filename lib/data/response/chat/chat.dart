import 'dart:convert';

import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final String? photoUrl;
  final String? name;
  final dynamic chatCode;
  final dynamic chatClosed;
  final String? senderEmail;
  final String? senderType;
  final String? receiverType;
  final int? senderId;
  final String? message;
  final int? isRead;
  final DateTime? createdAt;
  final String? userType;
  final String? employeeFullName;
  final dynamic totalUnread;
  final int? id;
  final int? receiverId;
  final List<dynamic>? attachment;
  final int? isEdited;
  final DateTime? deletedAt;
  final DateTime? updatedAt;
  final String? timeAt;

  const Chat(
      {this.photoUrl, 
      this.createdAt, 
      this.employeeFullName, 
      this.isRead, 
      this.message, 
      this.name, 
      this.senderEmail, 
      this.senderId, 
      this.totalUnread,
      this.chatCode, 
      this.userType,
      this.attachment,
      this.deletedAt,
      this.id,
      this.chatClosed,
      this.timeAt,
      this.receiverType,
      this.senderType,
      this.isEdited,
      this.receiverId,
      this.updatedAt});

  static List<Chat> fromList(List<dynamic> data) => data.map((chatObj) => Chat(
      photoUrl: chatObj['photo_url'] ?? '',
      createdAt: DateTime.tryParse(chatObj['created_at'] ?? DateTime.now().toIso8601String()),
      employeeFullName: chatObj['full_name'] ?? '',
      isRead: chatObj['is_read'] ?? 0,
      message: chatObj['message'] ?? '',
      name: chatObj['name'] ?? chatObj['full_name'],
      chatClosed: chatObj['chat_closed'] as dynamic,
      senderEmail: chatObj['sender_email'] ?? '',
      senderId: chatObj['sender_id'] ?? 0,
      totalUnread: chatObj['total_unread'] as dynamic,
      userType: chatObj['user_type'] ?? '',
      isEdited: chatObj['is_edited'] ?? 0,
      chatCode: chatObj['chat_code'] as dynamic,
      updatedAt: DateTime.tryParse(chatObj['updated_at'] ?? DateTime.now().toIso8601String()),
      deletedAt: DateTime.tryParse(chatObj['deleted_at'] ?? DateTime.now().toIso8601String()),
      receiverId: chatObj['receiver_id'] ?? 0,
      attachment: chatObj['attachment'] as List<dynamic>?,
      senderType: chatObj['sender_type'] ?? '',
      receiverType: chatObj['receiver_type'] ?? '',
      id: chatObj['id'] ?? 0,
      timeAt: chatObj['time_at'] ?? ''
    )).toList();
  
  Map<String, dynamic> toMap() => {
        'photo_url': photoUrl,
        'created_at': createdAt,
        'full_name': employeeFullName,
        'message': message,
        'sender_email': senderEmail,
        'sender_id': senderId,
        'total_unread': totalUnread,
        'user_type': userType,
        'is_read': isRead,
        'chat_closed': chatClosed,
        'chat_code': chatCode,
        'receiver_type': receiverType,
        'sender_type': senderType,
        'name': name,
        'is_edited': isEdited,
        'receiver_id': receiverId,
        'id': id,
        'attchment': attachment,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'time_at': timeAt
      };

  /// `dart:convert`
  ///
  /// Converts [Chat] to a JSON string.
  String toJson() => json.encode(toMap());

  Chat copyWith(
      String? photoUrl,
      String? name,
      String? senderEmail,
      int? senderId,
      String? message,
      int? isRead,
      DateTime? createdAt,
      String? userType,
      String? employeeFullName,
      dynamic totalUnread,
      String? receiverType,
      String? senderType,
      dynamic chatClosed,
      dynamic chatCode,
      int? receiverId,
      DateTime? deletedAt,
      DateTime? updatedAt,
      int? isEdited,
      List<dynamic>? attachment,
      int? id,
      String? timeAt) {
    return Chat(
        photoUrl: photoUrl ?? this.photoUrl,
        name: name ?? this.name,
        senderEmail: senderEmail ?? this.senderEmail,
        senderId: senderId ?? this.senderId,
        message: message ?? this.message,
        isRead: isRead ?? this.isRead,
        createdAt: createdAt ?? this.createdAt,
        userType: userType ?? this.userType,
        employeeFullName: employeeFullName ?? this.employeeFullName,
        totalUnread: totalUnread ?? this.totalUnread,
        id: id ?? this.id,
        chatClosed: chatClosed ?? this.chatClosed,
        chatCode: chatCode ?? this.chatCode,
        isEdited: isEdited ?? this.isEdited,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        senderType: senderType ?? this.senderType,
        receiverType: receiverType ?? this.receiverType,
        receiverId: receiverId ?? this.receiverId,
        timeAt: timeAt ?? this.timeAt,
        attachment: attachment ?? this.attachment);
  }

  @override
  List<Object?> get props {
    return [
      photoUrl,
      createdAt,
      senderEmail,
      senderId,
      isRead,
      chatClosed,
      chatCode,
      userType,
      totalUnread,
      employeeFullName,
      message,
      name,
      timeAt,
      receiverId,
      isEdited,
      attachment,
      senderType,
      receiverType,
      updatedAt,
      deletedAt,
      id
    ];
  }
}
