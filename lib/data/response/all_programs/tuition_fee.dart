import 'dart:convert';

import 'package:equatable/equatable.dart';

class TuitionFee extends Equatable {
  final int? id;
  final String? programId;
  final String? studentType;
  final String? paymentType;
  final int? amount;
  final dynamic afterScholarship;
  final int? scholarshipPercent;
  final dynamic comment;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TuitionFee({
    this.id,
    this.programId,
    this.studentType,
    this.paymentType,
    this.amount,
    this.afterScholarship,
    this.scholarshipPercent,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory TuitionFee.fromMap(Map<String, dynamic> data) => TuitionFee(
        id: data['id'] as int?,
        programId: data['program_id'] as String?,
        studentType: data['student_type'] as String?,
        paymentType: data['payment_type'] as String?,
        amount: data['amount'] as int?,
        afterScholarship: data['after_scholarship'] as dynamic,
        scholarshipPercent: data['scholarship_percent'] as dynamic,
        comment: data['comment'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'program_id': programId,
        'student_type': studentType,
        'payment_type': paymentType,
        'amount': amount,
        'after_scholarship': afterScholarship,
        'scholarship_percent': scholarshipPercent,
        'comment': comment,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TuitionFee].
  factory TuitionFee.fromJson(String data) {
    return TuitionFee.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TuitionFee] to a JSON string.
  String toJson() => json.encode(toMap());

  TuitionFee copyWith({
    int? id,
    String? programId,
    String? studentType,
    String? paymentType,
    int? amount,
    double? afterScholarship,
    int? scholarshipPercent,
    dynamic comment,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TuitionFee(
      id: id ?? this.id,
      programId: programId ?? this.programId,
      studentType: studentType ?? this.studentType,
      paymentType: paymentType ?? this.paymentType,
      amount: amount ?? this.amount,
      afterScholarship: afterScholarship ?? this.afterScholarship,
      scholarshipPercent: scholarshipPercent ?? this.scholarshipPercent,
      comment: comment ?? this.comment,
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
      paymentType,
      amount,
      afterScholarship,
      scholarshipPercent,
      comment,
      createdAt,
      updatedAt,
    ];
  }
}
