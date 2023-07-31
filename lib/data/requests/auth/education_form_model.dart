import 'dart:convert';

import 'package:equatable/equatable.dart';

class EducationFormModel extends Equatable {
  final String? action;
  final int? userId;
  final String? highSchoolCountry;
  final String? highSchoolCity;
  final String? highSchool;
  final String? highSchoolGraduationYear;
  final String? studentIdNumber;
  final String? highSchoolMajors;
  final String? studyLanguage;
  final int? highSchoolId;

  const EducationFormModel({
    this.action,
    this.userId,
    this.highSchoolCountry,
    this.highSchoolCity,
    this.highSchool,
    this.highSchoolGraduationYear,
    this.studentIdNumber,
    this.highSchoolMajors,
    this.studyLanguage,
    this.highSchoolId,
  });

  factory EducationFormModel.fromMap(Map<String, dynamic> data) {
    return EducationFormModel(
      action: data['action'] as String?,
      userId: data['user_id'] as int?,
      highSchoolId: data['high_school_id'] as int?,
      highSchoolCountry: data['high_school_country'] as String?,
      highSchoolCity: data['high_school_city'] as String?,
      highSchool: data['high_school'] as String?,
      highSchoolGraduationYear: data['high_school_graduation_year'] as String?,
      studentIdNumber: data['student_id_number'] as String?,
      highSchoolMajors: data['high_school_majors'] as String?,
      studyLanguage: data['study_language'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'action': action,
        'user_id': userId,
        'high_school_country': highSchoolCountry,
        'high_school_city': highSchoolCity,
        'high_school': highSchool,
        'high_school_graduation_year': highSchoolGraduationYear,
        'student_id_number': studentIdNumber,
        'high_school_majors': highSchoolMajors,
        'study_language': studyLanguage,
        'high_school_id': highSchoolId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EducationFormModel].
  factory EducationFormModel.fromJson(String data) {
    return EducationFormModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EducationFormModel] to a JSON string.
  String toJson() => json.encode(toMap());

  EducationFormModel copyEducationWith({
    String? action,
    int? userId,
    String? highSchoolCountry,
    String? highSchoolCity,
    String? highSchool,
    String? highSchoolGraduationYear,
    String? studentIdNumber,
    String? highSchoolMajors,
    String? studyLanguage,
  }) {
    return EducationFormModel(
      action: action ?? this.action,
      userId: userId ?? this.userId,
      highSchoolCountry: highSchoolCountry ?? this.highSchoolCountry,
      highSchoolCity: highSchoolCity ?? this.highSchoolCity,
      highSchool: highSchool ?? this.highSchool,
      highSchoolGraduationYear:
          highSchoolGraduationYear ?? this.highSchoolGraduationYear,
      studentIdNumber: studentIdNumber ?? this.studentIdNumber,
      highSchoolMajors: highSchoolMajors ?? this.highSchoolMajors,
      studyLanguage: studyLanguage ?? this.studyLanguage,
    );
  }

  @override
  List<Object?> get props {
    return [
      action,
      userId,
      highSchoolCountry,
      highSchoolCity,
      highSchool,
      highSchoolGraduationYear,
      studentIdNumber,
      highSchoolMajors,
      studyLanguage,
    ];
  }
}
