import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class ProfileFormModel extends Equatable {
  final dynamic message;
  final Data? data;

  const ProfileFormModel({this.message, this.data});

  factory ProfileFormModel.fromProfileFormModel(Map<String, dynamic> data) {
    return ProfileFormModel(
      message: data['message'] as dynamic,
      data: data['data'] == null
          ? null
          : Data.fromProfileFormModel(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toProfileFormModel() => {
        'message': message,
        'data': data?.toProfileFormModel(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileFormModel].
  factory ProfileFormModel.fromJson(String data) {
    return ProfileFormModel.fromProfileFormModel(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileFormModel] to a JSON string.
  String toJson() => json.encode(toProfileFormModel());

  ProfileFormModel copyWith({
    dynamic message,
    Data? data,
  }) {
    return ProfileFormModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [message, data];
}
