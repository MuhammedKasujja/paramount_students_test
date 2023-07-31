import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdmissionDeadline extends Equatable {
  final int? id;
  final String? programId;
  final String? semesterName;
  final String? description;
  final String? startDate;
  final String? endDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AdmissionDeadline({
    this.id,
    this.programId,
    this.semesterName,
    this.description,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  factory AdmissionDeadline.fromMap(Map<String, dynamic> data) {
    return AdmissionDeadline(
      id: data['id'] as int?,
      programId: data['program_id'] as String?,
      semesterName: data['semester_name'] as String?,
      description: data['description'] as String?,
      startDate: data['start_date'] as String?,
      endDate: data['end_date'] as String?,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.parse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'program_id': programId,
        'semester_name': semesterName,
        'description': description,
        'start_date': startDate,
        'end_date': endDate,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdmissionDeadline].
  factory AdmissionDeadline.fromJson(String data) {
    return AdmissionDeadline.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdmissionDeadline] to a JSON string.
  String toJson() => json.encode(toMap());

  AdmissionDeadline copyWith({
    int? id,
    String? programId,
    String? semesterName,
    String? description,
    String? startDate,
    String? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AdmissionDeadline(
      id: id ?? this.id,
      programId: programId ?? this.programId,
      semesterName: semesterName ?? this.semesterName,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      programId,
      semesterName,
      description,
      startDate,
      endDate,
      createdAt,
      updatedAt,
    ];
  }
}
