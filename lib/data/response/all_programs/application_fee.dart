import 'dart:convert';

import 'package:equatable/equatable.dart';

class ApplicationFee extends Equatable {
  final int? id;
  final String? programId;
  final String? studentType;
  final String? amount;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ApplicationFee({
    this.id,
    this.programId,
    this.studentType,
    this.amount,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory ApplicationFee.fromMap(Map<String, dynamic> data) {
    return ApplicationFee(
      id: data['id'] as int?,
      programId: data['program_id'] as String?,
      studentType: data['student_type'] as String?,
      amount: data['amount'] as String?,
      description: data['description'] as String?,
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
        'student_type': studentType,
        'amount': amount,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApplicationFee].
  factory ApplicationFee.fromJson(String data) {
    return ApplicationFee.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ApplicationFee] to a JSON string.
  String toJson() => json.encode(toMap());

  ApplicationFee copyWith({
    int? id,
    String? programId,
    String? studentType,
    String? amount,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ApplicationFee(
      id: id ?? this.id,
      programId: programId ?? this.programId,
      studentType: studentType ?? this.studentType,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      programId,
      studentType,
      amount,
      description,
      createdAt,
      updatedAt,
    ];
  }
}
