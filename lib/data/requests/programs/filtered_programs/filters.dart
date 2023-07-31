import 'dart:convert';

import 'package:equatable/equatable.dart';

class Filters extends Equatable {
  final List<dynamic>? programName;
  final List<dynamic>? programAward;
  final List<dynamic>? programType;
  final List<dynamic>? status;
  final List<dynamic>? universityId;
  final List<dynamic>? programFaculty;
  final List<dynamic>? stateId;
  final List<dynamic>? countryId;
  final List<dynamic>? studyType;
  final List<dynamic>? studyLanguage;
  final List<dynamic>? programDuration;
  final List<dynamic>? programEcts;
  final List<dynamic>? learningMode;
  final List<dynamic>? tuitionFee;
  final List<dynamic>? applicationFee;
  final List<dynamic>? studentType;

  const Filters({
    this.programName,
    this.programAward,
    this.programType,
    this.status,
    this.universityId,
    this.programFaculty,
    this.stateId,
    this.countryId,
    this.studyType,
    this.studyLanguage,
    this.programDuration,
    this.programEcts,
    this.learningMode,
    this.tuitionFee,
    this.applicationFee,
    this.studentType,
  });

  factory Filters.fromMap(Map<String, dynamic> data) => Filters(
        programName: data['program_name'] as List<dynamic>?,
        programAward: data['program_award'] as List<dynamic>?,
        programType: data['program_type'] as List<dynamic>?,
        status: data['status'] as List<dynamic>?,
        universityId: data['university_id'] as List<dynamic>?,
        programFaculty: data['program_faculty'] as List<dynamic>?,
        stateId: data['state_id'] as List<dynamic>?,
        countryId: data['country_id'] as List<dynamic>?,
        studyType: data['study_type'] as List<dynamic>?,
        studyLanguage: data['study_language'] as List<dynamic>?,
        programDuration: data['program_duration'] as List<dynamic>?,
        programEcts: data['program_ects'] as List<dynamic>?,
        learningMode: data['learning_mode'] as List<dynamic>?,
        tuitionFee: data['tuition_fee'] as List<dynamic>?,
        applicationFee: data['applicationFee'] as List<dynamic>?,
        studentType: data['student_type'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'program_name': programName,
        'program_award': programAward,
        'program_type': programType,
        'status': status,
        'university_id': universityId,
        'program_faculty': programFaculty,
        'state_id': stateId,
        'country_id': countryId,
        'study_type': studyType,
        'study_language': studyLanguage,
        'program_duration': programDuration,
        'program_ects': programEcts,
        'learning_mode': learningMode,
        'tuition_fee': tuitionFee,
        'applicationFee': applicationFee,
        'student_type': studentType,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Filters].
  factory Filters.fromJson(String data) {
    return Filters.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Filters] to a JSON string.
  String toJson() => json.encode(toMap());

  Filters copyWith({
    List<dynamic>? programName,
    List<dynamic>? programAward,
    List<dynamic>? programType,
    List<dynamic>? status,
    List<dynamic>? universityId,
    List<dynamic>? programFaculty,
    List<dynamic>? stateId,
    List<dynamic>? countryId,
    List<dynamic>? studyType,
    List<dynamic>? studyLanguage,
    List<dynamic>? programDuration,
    List<dynamic>? programEcts,
    List<dynamic>? learningMode,
    List<dynamic>? tuitionFee,
    List<dynamic>? applicationFee,
    List<dynamic>? studentType,
  }) {
    return Filters(
      programName: programName ?? this.programName,
      programAward: programAward ?? this.programAward,
      programType: programType ?? this.programType,
      status: status ?? this.status,
      universityId: universityId ?? this.universityId,
      programFaculty: programFaculty ?? this.programFaculty,
      stateId: stateId ?? this.stateId,
      countryId: countryId ?? this.countryId,
      studyType: studyType ?? this.studyType,
      studyLanguage: studyLanguage ?? this.studyLanguage,
      programDuration: programDuration ?? this.programDuration,
      programEcts: programEcts ?? this.programEcts,
      learningMode: learningMode ?? this.learningMode,
      tuitionFee: tuitionFee ?? this.tuitionFee,
      applicationFee: applicationFee ?? this.applicationFee,
      studentType: studentType ?? this.studentType,
    );
  }

  @override
  List<Object?> get props {
    return [
      programName,
      programAward,
      programType,
      status,
      universityId,
      programFaculty,
      stateId,
      countryId,
      studyType,
      studyLanguage,
      programDuration,
      programEcts,
      learningMode,
      tuitionFee,
      applicationFee,
      studentType,
    ];
  }
}
