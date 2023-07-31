import 'dart:convert';

import 'package:equatable/equatable.dart';

class Education extends Equatable {
  final String? highSchoolCountry;
  final String? highSchoolCity;
  final String? highSchool;
  final String? highSchoolId;
  final int? highSchoolGraduationYear;
  final dynamic studentIdNumber;
  final String? highSchoolMajors;
  final String? studyLanguage;

  const Education(
      {this.highSchoolCountry,
      this.highSchoolCity,
      this.highSchool,
      this.highSchoolGraduationYear,
      this.studentIdNumber,
      this.highSchoolMajors,
      this.studyLanguage,
      this.highSchoolId});

  factory Education.fromMap(Map<String, dynamic> data) => Education(
      highSchoolCountry: data['high_school_country'] as String?,
      highSchoolCity: data['high_school_city'] as String?,
      highSchool: data['high_school'] as String?,
      highSchoolGraduationYear: data['high_school_graduation_year'] as int?,
      studentIdNumber: data['student_id_number'],
      highSchoolMajors: data['high_school_majors'] as String?,
      studyLanguage: data['study_language'] as String?,
      highSchoolId: data['high_school_id'] as String?);

  Map<String, dynamic> toMap() => {
        'high_school_country': highSchoolCountry,
        'high_school_city': highSchoolCity,
        'high_school': highSchool,
        'high_school_graduation_year': highSchoolGraduationYear,
        'student_id_number': studentIdNumber,
        'high_school_majors': highSchoolMajors,
        'study_language': studyLanguage,
        'high_school_id': highSchoolId
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Education].
  factory Education.fromJson(String data) {
    return Education.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Education] to a JSON string.
  String toJson() => json.encode(toMap());

  Education copyWith(
      {String? highSchoolCountry,
      String? highSchoolCity,
      String? highSchool,
      int? highSchoolGraduationYear,
      dynamic studentIdNumber,
      String? highSchoolMajors,
      String? studyLanguage,
      String? highSchoolId}) {
    return Education(
        highSchoolCountry: highSchoolCountry ?? this.highSchoolCountry,
        highSchoolCity: highSchoolCity ?? this.highSchoolCity,
        highSchool: highSchool ?? this.highSchool,
        highSchoolGraduationYear:
            highSchoolGraduationYear ?? this.highSchoolGraduationYear,
        studentIdNumber: studentIdNumber ?? this.studentIdNumber,
        highSchoolMajors: highSchoolMajors ?? this.highSchoolMajors,
        studyLanguage: studyLanguage ?? this.studyLanguage,
        highSchoolId: highSchoolId ?? this.highSchoolId);
  }

  @override
  List<Object?> get props {
    return [
      highSchoolCountry,
      highSchoolCity,
      highSchool,
      highSchoolGraduationYear,
      studentIdNumber,
      highSchoolMajors,
      studyLanguage,
      highSchoolId
    ];
  }
}
