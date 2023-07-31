import 'dart:convert';

import 'package:equatable/equatable.dart';
import './chat.dart';

class Message extends Equatable {
  final List<Chat>? chats;

  const Message({this.chats});

  factory Message.fromList(List<dynamic> data) => Message(
        chats: Chat.fromList(data),
      );

  Map<String, dynamic> toMap() => {
        'chats': chats,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  // factory Message.fromJson(String data) {
  //   return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());

  Message copyWith({List<Chat>? chats}) {
    return Message(chats: chats ?? this.chats);
  }

  @override
  List<Object?> get props {
    return [
      chats,
    ];
  }
}
