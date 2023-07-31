import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'filters.dart';

class FilteredPrograms extends Equatable {
  final Filters? filters;

  const FilteredPrograms({this.filters});

  factory FilteredPrograms.fromMap(Map<String, dynamic> data) {
    return FilteredPrograms(
      filters: data['filters'] == null
          ? null
          : Filters.fromMap(data['filters'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'filters': filters?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FilteredPrograms].
  factory FilteredPrograms.fromJson(String data) {
    return FilteredPrograms.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FilteredPrograms] to a JSON string.
  String toJson() => json.encode(toMap());

  FilteredPrograms copyWith({
    Filters? filters,
  }) {
    return FilteredPrograms(
      filters: filters ?? this.filters,
    );
  }

  @override
  List<Object?> get props => [filters];
}
