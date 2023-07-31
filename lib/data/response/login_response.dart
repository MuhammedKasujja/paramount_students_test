// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.userdata,
  });

  Userdata userdata;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userdata: Userdata.fromJson(json["userdata"]),
      );

  Map<String, dynamic> toJson() => {
        "userdata": userdata.toJson(),
      };
}

class Userdata {
  Userdata({
    required this.id,
    required this.fullName,
    required this.fatherName,
    required this.motherName,
    required this.dob,
    required this.email,
    required this.gender,
    required this.password,
    required this.uniqueId,
    required this.phone,
    required this.citizen,
    required this.countryResidence,
    required this.cityRegion,
    required this.homeAddress,
    this.passportInfo,
    required this.highSchoolCountry,
    required this.highSchoolCity,
    required this.highSchool,
    required this.highSchoolGraduationYear,
    required this.studentIdNumber,
    required this.highSchoolMajors,
    required this.studyLanguage,
    this.highschoolMarksheet,
    this.highschoolCertificate,
    this.formalPhoto,
    this.localIdCard,
    this.passportFront,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String fullName;
  String fatherName;
  String motherName;
  DateTime dob;
  String email;
  String gender;
  String password;
  String uniqueId;
  String phone;
  String citizen;
  String countryResidence;
  String cityRegion;
  String homeAddress;
  dynamic passportInfo;
  String highSchoolCountry;
  String highSchoolCity;
  String highSchool;
  String highSchoolGraduationYear;
  String studentIdNumber;
  String highSchoolMajors;
  String studyLanguage;
  dynamic highschoolMarksheet;
  dynamic highschoolCertificate;
  dynamic formalPhoto;
  dynamic localIdCard;
  dynamic passportFront;
  DateTime createdAt;
  DateTime updatedAt;

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        fullName: json["full_name"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        dob: DateTime.parse(json["dob"]),
        email: json["email"],
        gender: json["gender"],
        password: json["password"],
        uniqueId: json["unique_id"],
        phone: json["phone"],
        citizen: json["citizen"],
        countryResidence: json["country_residence"],
        cityRegion: json["city_region"],
        homeAddress: json["home_address"],
        passportInfo: json["passport_info"],
        highSchoolCountry: json["high_school_country"],
        highSchoolCity: json["high_school_city"],
        highSchool: json["high_school"],
        highSchoolGraduationYear: json["high_school_graduation_year"],
        studentIdNumber: json["student_id_number"],
        highSchoolMajors: json["high_school_majors"],
        studyLanguage: json["study_language"],
        highschoolMarksheet: json["highschool_marksheet"],
        highschoolCertificate: json["highschool_certificate"],
        formalPhoto: json["formal_photo"],
        localIdCard: json["local_id_card"],
        passportFront: json["passport_front"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "father_name": fatherName,
        "mother_name": motherName,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "email": email,
        "gender": gender,
        "password": password,
        "unique_id": uniqueId,
        "phone": phone,
        "citizen": citizen,
        "country_residence": countryResidence,
        "city_region": cityRegion,
        "home_address": homeAddress,
        "passport_info": passportInfo,
        "high_school_country": highSchoolCountry,
        "high_school_city": highSchoolCity,
        "high_school": highSchool,
        "high_school_graduation_year": highSchoolGraduationYear,
        "student_id_number": studentIdNumber,
        "high_school_majors": highSchoolMajors,
        "study_language": studyLanguage,
        "highschool_marksheet": highschoolMarksheet,
        "highschool_certificate": highschoolCertificate,
        "formal_photo": formalPhoto,
        "local_id_card": localIdCard,
        "passport_front": passportFront,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
