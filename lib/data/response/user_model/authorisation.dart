import 'dart:convert';

import 'package:equatable/equatable.dart';

class Authorisation extends Equatable {
  final String? token;
  final String? type;

  const Authorisation({this.token, this.type});

  factory Authorisation.fromMap(Map<String, dynamic> data) => Authorisation(
        token: data['token'] as String?,
        type: data['type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'token': token,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Authorisation].
  factory Authorisation.fromJson(String data) {
    return Authorisation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Authorisation] to a JSON string.
  String toJson() => json.encode(toMap());

  Authorisation copyWith({
    String? token,
    String? type,
  }) {
    return Authorisation(
      token: token ?? this.token,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [token, type];
}
