import 'dart:convert';

import 'package:equatable/equatable.dart';

class StateModelClass extends Equatable {
  final int? id;
  final int? countryId;
  final String? name;
  final dynamic slogan;
  final dynamic createdAt;
  final dynamic updatedAt;

  const StateModelClass({
    this.id,
    this.countryId,
    this.name,
    this.slogan,
    this.createdAt,
    this.updatedAt,
  });

  factory StateModelClass.fromMap(Map<String, dynamic> data) {
    return StateModelClass(
      id: data['id'] as int?,
      countryId: data['country_id'] as int?,
      name: data['name'] as String?,
      slogan: data['slogan'] as dynamic,
      createdAt: data['created_at'] as dynamic,
      updatedAt: data['updated_at'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'country_id': countryId,
        'name': name,
        'slogan': slogan,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StateModelClass].
  factory StateModelClass.fromJson(String data) {
    return StateModelClass.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StateModelClass] to a JSON string.
  String toJson() => json.encode(toMap());

  StateModelClass copyWith({
    int? id,
    int? countryId,
    String? name,
    dynamic slogan,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    return StateModelClass(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      name: name ?? this.name,
      slogan: slogan ?? this.slogan,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      countryId,
      name,
      slogan,
      createdAt,
      updatedAt,
    ];
  }
}
