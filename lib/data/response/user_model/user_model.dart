import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'authorisation.dart';
import 'user.dart';

class UserModel extends Equatable {
  final User? user;
  final String? status;
  final String? message;
  final Authorisation? authorisation;

  const UserModel({
    this.user,
    this.status,
    this.message,
    this.authorisation,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
        status: data['status'] as String?,
        message: data['message'] as String?,
        authorisation: data['authorisation'] == null
            ? null
            : Authorisation.fromMap(
                data['authorisation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'status': status,
        'message': message,
        'authorisation': authorisation?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UserModel copyWith({
    User? user,
    String? status,
    String? message,
    Authorisation? authorisation,
  }) {
    return UserModel(
      user: user ?? this.user,
      status: status ?? this.status,
      message: message ?? this.message,
      authorisation: authorisation ?? this.authorisation,
    );
  }

  @override
  List<Object?> get props => [user, status, message, authorisation];
}
