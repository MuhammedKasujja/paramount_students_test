import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'admission_deadline.dart';
import 'application_fee.dart';
import 'tuition_fee.dart';
import 'university.dart';

class Datum extends Equatable {
  final int? id;
  final int? universityId;
  final String? uniqueId;
  final int? facultyId;
  final String? status;
  final String? countryId;
  final String? stateId;
  final List<dynamic>? studyType;
  final List<dynamic>? studyLanguage;
  final String? programCode;
  final String? programType;
  final String? programName;
  final String? programAward;
  final String? programDuration;
  final String? programEcts;
  final List<dynamic>? learningMode;
  final String? coverPhotoUrl;
  final String? academicDescription;
  final dynamic comment;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final University? university;
  final bool? isActive;
  final String? faculty;
  final dynamic deadline;
  final String? studyLocation;
  final String? city;
  final String? programFaculty;
  final List<ApplicationFee>? applicationFees;
  final List<AdmissionDeadline>? admissionDeadlines;
  final List<TuitionFee>? tuitionFees;

  const Datum({
    this.id,
    this.universityId,
    this.uniqueId,
    this.facultyId,
    this.status,
    this.countryId,
    this.stateId,
    this.studyType,
    this.studyLanguage,
    this.programCode,
    this.programType,
    this.programName,
    this.programAward,
    this.programDuration,
    this.programEcts,
    this.learningMode,
    this.coverPhotoUrl,
    this.academicDescription,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.university,
    this.isActive,
    this.faculty,
    this.deadline,
    this.studyLocation,
    this.city,
    this.programFaculty,
    this.applicationFees,
    this.admissionDeadlines,
    this.tuitionFees,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as int?,
        universityId: data['university_id'] as int?,
        uniqueId: data['unique_id'] as String?,
        facultyId: data['faculty_id'] as int?,
        status: data['status'] as String?,
        countryId: data['country_id'] as String?,
        stateId: data['state_id'] as String?,
        studyType: data['study_type'] as List<dynamic>?,
        studyLanguage: data['study_language'] as List<dynamic>?,
        programCode: data['program_code'] as String?,
        programType: data['program_type'] as String?,
        programName: data['program_name'] as String?,
        programAward: data['program_award'] as String?,
        programDuration: data['program_duration'] as String?,
        programEcts: data['program_ECTS'] as String?,
        learningMode: data['learning_mode'] as List<dynamic>?,
        coverPhotoUrl: data['cover_photo_url'] as String?,
        academicDescription: data['academic_description'] as String?,
        comment: data['comment'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        university: data['university'] == null
            ? null
            : University.fromMap(data['university'] as Map<String, dynamic>),
        isActive: data['is_active'] as bool?,
        faculty: data['faculty'] as String?,
        deadline: data['deadline'] as dynamic,
        studyLocation: data['study_location'] as String?,
        city: data['city'] as String?,
        programFaculty: data['program_faculty'] as String?,
        applicationFees: (data['application_fees'] as List<dynamic>?)
            ?.map((e) => ApplicationFee.fromMap(e as Map<String, dynamic>))
            .toList(),
        admissionDeadlines: (data['admission_deadlines'] as List<dynamic>?)
            ?.map((e) => AdmissionDeadline.fromMap(e as Map<String, dynamic>))
            .toList(),
        tuitionFees: (data['tuition_fees'] as List<dynamic>?)
            ?.map((e) => TuitionFee.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  ///! change this List<String>?) to List<dynamic>?)

  Map<String, dynamic> toMap() => {
        'id': id,
        'university_id': universityId,
        'unique_id': uniqueId,
        'faculty_id': facultyId,
        'status': status,
        'country_id': countryId,
        'state_id': stateId,
        'study_type': studyType,
        'study_language': studyLanguage,
        'program_code': programCode,
        'program_type': programType,
        'program_name': programName,
        'program_award': programAward,
        'program_duration': programDuration,
        'program_ECTS': programEcts,
        'learning_mode': learningMode,
        'cover_photo_url': coverPhotoUrl,
        'academic_description': academicDescription,
        'comment': comment,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'university': university?.toMap(),
        'is_active': isActive,
        'faculty': faculty,
        'deadline': deadline,
        'study_location': studyLocation,
        'city': city,
        'program_faculty': programFaculty,
        'application_fees': applicationFees?.map((e) => e.toMap()).toList(),
        'admission_deadlines':
            admissionDeadlines?.map((e) => e.toMap()).toList(),
        'tuition_fees': tuitionFees?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    int? id,
    int? universityId,
    String? uniqueId,
    int? facultyId,
    String? status,
    String? countryId,
    String? stateId,
    List<dynamic>? studyType,
    List<dynamic>? studyLanguage,
    String? programCode,
    String? programType,
    String? programName,
    String? programAward,
    String? programDuration,
    String? programEcts,
    List<dynamic>? learningMode,
    String? coverPhotoUrl,
    String? academicDescription,
    dynamic comment,
    DateTime? createdAt,
    DateTime? updatedAt,
    University? university,
    bool? isActive,
    String? faculty,
    dynamic deadline,
    String? studyLocation,
    String? city,
    String? programFaculty,
    List<ApplicationFee>? applicationFees,
    List<AdmissionDeadline>? admissionDeadlines,
    List<TuitionFee>? tuitionFees,
  }) {
    return Datum(
      id: id ?? this.id,
      universityId: universityId ?? this.universityId,
      uniqueId: uniqueId ?? this.uniqueId,
      facultyId: facultyId ?? this.facultyId,
      status: status ?? this.status,
      countryId: countryId ?? this.countryId,
      stateId: stateId ?? this.stateId,
      studyType: studyType ?? this.studyType,
      studyLanguage: studyLanguage ?? this.studyLanguage,
      programCode: programCode ?? this.programCode,
      programType: programType ?? this.programType,
      programName: programName ?? this.programName,
      programAward: programAward ?? this.programAward,
      programDuration: programDuration ?? this.programDuration,
      programEcts: programEcts ?? this.programEcts,
      learningMode: learningMode ?? this.learningMode,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      academicDescription: academicDescription ?? this.academicDescription,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      university: university ?? this.university,
      isActive: isActive ?? this.isActive,
      faculty: faculty ?? this.faculty,
      deadline: deadline ?? this.deadline,
      studyLocation: studyLocation ?? this.studyLocation,
      city: city ?? this.city,
      programFaculty: programFaculty ?? this.programFaculty,
      applicationFees: applicationFees ?? this.applicationFees,
      admissionDeadlines: admissionDeadlines ?? this.admissionDeadlines,
      tuitionFees: tuitionFees ?? this.tuitionFees,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      universityId,
      uniqueId,
      facultyId,
      status,
      countryId,
      stateId,
      studyType,
      studyLanguage,
      programCode,
      programType,
      programName,
      programAward,
      programDuration,
      programEcts,
      learningMode,
      coverPhotoUrl,
      academicDescription,
      comment,
      createdAt,
      updatedAt,
      university,
      isActive,
      faculty,
      deadline,
      studyLocation,
      city,
      programFaculty,
      applicationFees,
      admissionDeadlines,
      tuitionFees,
    ];
  }
}
