import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class AllPrograms extends Equatable {
  final Data? data;

  const AllPrograms({this.data});

  factory AllPrograms.fromMap(Map<String, dynamic> data) => AllPrograms(
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AllPrograms].
  factory AllPrograms.fromJson(String data) {
    return AllPrograms.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AllPrograms] to a JSON string.
  String toJson() => json.encode(toMap());

  AllPrograms copyWith({
    Data? data,
  }) {
    return AllPrograms(
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [data];
}
