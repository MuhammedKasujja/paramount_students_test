class ResponseData {
  ResponseData({
    required this.currentPage,
    required this.data,
  });
  late final int currentPage;
  late final List<ResponseListData> data;

  static ResponseData fromJson(Map<String, dynamic> json) {
    return ResponseData(
      currentPage: json['current_page'],
      data: List.from(json['data'])
          .map((e) => ResponseListData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ResponseListData {
  ResponseListData({
    required this.id,
    required this.universityId,
    required this.uniqueId,
    required this.facultyId,
    required this.status,
    required this.countryId,
    required this.stateId,
    required this.studyType,
    required this.studyLanguage,
    required this.programCode,
    required this.programType,
    required this.programName,
    required this.programAward,
    required this.programDuration,
    required this.programECTS,
    required this.learningMode,
    required this.coverPhotoUrl,
    this.academicDescription,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.university,
    required this.isActive,
    required this.faculty,
    this.deadline,
    required this.studyLocation,
    required this.city,
    required this.programFaculty,
    required this.applicationFees,
    required this.admissionDeadlines,
    required this.tuitionFees,
  });
  late final int id;
  late final int universityId;
  late final String uniqueId;
  late final int facultyId;
  late final String status;
  late final String countryId;
  late final String stateId;
  late final List<String> studyType;
  late final List<String> studyLanguage;
  late final String programCode;
  late final String programType;
  late final String programName;
  late final String programAward;
  late final String programDuration;
  late final String programECTS;
  late final List<String> learningMode;
  late final String coverPhotoUrl;
  late final dynamic academicDescription;
  late final dynamic comment;
  late final String createdAt;
  late final String updatedAt;
  late final University university;
  late final bool isActive;
  late final String faculty;
  late final dynamic deadline;
  late final String studyLocation;
  late final String city;
  late final String programFaculty;
  late final List<ApplicationFees> applicationFees;
  late final List<AdmissionDeadlines> admissionDeadlines;
  late final List<TuitionFees> tuitionFees;

  static ResponseListData fromJson(Map<String, dynamic> json) {
    return ResponseListData(
      id: json['id'],
      universityId: json['university_id'],
      uniqueId: json['unique_id'],
      facultyId: json['faculty_id'],
      status: json['status'],
      countryId: json['country_id'],
      stateId: json['state_id'],
      studyType: List.castFrom<dynamic, String>(json['study_type']),
      studyLanguage: List.castFrom<dynamic, String>(json['study_language']),
      programCode: json['program_code'],
      programType: json['program_type'],
      programName: json['program_name'],
      programAward: json['program_award'],
      programDuration: json['program_duration'],
      programECTS: json['program_ECTS'],
      learningMode: List.castFrom<dynamic, String>(json['learning_mode']),
      coverPhotoUrl: json['cover_photo_url'],
      academicDescription: json['academicDescription'],
      comment: json['comment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      university: University.fromJson(json['university']),
      isActive: json['is_active'],
      faculty: json['faculty'],
      deadline: json['deadline'],
      studyLocation: json['study_location'],
      city: json['city'],
      programFaculty: json['program_faculty'],
      applicationFees: List.from(json['application_fees'])
          .map((e) => ApplicationFees.fromJson(e))
          .toList(),
      admissionDeadlines: List.from(json['admission_deadlines'])
          .map((e) => AdmissionDeadlines.fromJson(e))
          .toList(),
      tuitionFees: List.from(json['tuition_fees'])
          .map((e) => TuitionFees.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['university_id'] = universityId;
    _data['unique_id'] = uniqueId;
    _data['faculty_id'] = facultyId;
    _data['status'] = status;
    _data['country_id'] = countryId;
    _data['state_id'] = stateId;
    _data['study_type'] = studyType;
    _data['study_language'] = studyLanguage;
    _data['program_code'] = programCode;
    _data['program_type'] = programType;
    _data['program_name'] = programName;
    _data['program_award'] = programAward;
    _data['program_duration'] = programDuration;
    _data['program_ECTS'] = programECTS;
    _data['learning_mode'] = learningMode;
    _data['cover_photo_url'] = coverPhotoUrl;
    _data['academic_description'] = academicDescription;
    _data['comment'] = comment;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['university'] = university.toJson();
    _data['is_active'] = isActive;
    _data['faculty'] = faculty;
    _data['deadline'] = deadline;
    _data['study_location'] = studyLocation;
    _data['city'] = city;
    _data['program_faculty'] = programFaculty;
    _data['application_fees'] = applicationFees.map((e) => e.toJson()).toList();
    _data['admission_deadlines'] =
        admissionDeadlines.map((e) => e.toJson()).toList();
    _data['tuition_fees'] = tuitionFees.map((e) => e.toJson()).toList();
    return _data;
  }
}

class University {
  University({
    required this.id,
    this.walletNumber,
    required this.name,
    required this.type,
    this.uniqueId,
    required this.registeredDate,
    required this.address,
    required this.countryId,
    required this.stateId,
    required this.postalCode,
    required this.coverPhotoUrl,
    required this.locationTitle,
    required this.locationDescription,
    required this.mediaUrl,
    required this.audioUrl,
    required this.hotspotX,
    required this.hotspotY,
    required this.hotspotContent,
    required this.verification,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    this.overview,
    this.ranking,
    this.yearlyCost,
    required this.galleries,
    required this.virtualTours,
    required this.country,
    required this.city,
  });
  late final int id;
  late final dynamic walletNumber;
  late final String name;
  late final String type;
  late final dynamic uniqueId;
  late final String registeredDate;
  late final String address;
  late final String countryId;
  late final String stateId;
  late final String postalCode;
  late final String coverPhotoUrl;
  late final String locationTitle;
  late final String locationDescription;
  late final String mediaUrl;
  late final String audioUrl;
  late final int hotspotX;
  late final int hotspotY;
  late final String hotspotContent;
  late final String verification;
  late final int active;
  late final String createdAt;
  late final String updatedAt;
  late final dynamic overview;
  late final dynamic ranking;
  late final dynamic yearlyCost;
  late final List<String> galleries;
  late final List<String> virtualTours;
  late final String country;
  late final String city;

  static University fromJson(Map<String, dynamic> json) {
    return University(
      id: json['id'],
      walletNumber: json['walletNumber'],
      name: json['name'],
      type: json['type'],
      uniqueId: json['name'],
      registeredDate: json['registered_date'],
      address: json['address'],
      countryId: json['country_id'],
      stateId: json['state_id'],
      postalCode: json['postal_code'],
      coverPhotoUrl: json['cover_photo_url'],
      locationTitle: json['location_title'],
      locationDescription: json['location_description'],
      mediaUrl: json['media_url'],
      audioUrl: json['audio_url'],
      hotspotX: json['hotspot_x'],
      hotspotY: json['hotspot_y'],
      hotspotContent: json['hotspot_content'],
      verification: json['verification'],
      active: json['active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      overview: json['overview'],
      ranking: json['ranking'],
      yearlyCost: json['yearlyCost'],
      galleries: List.castFrom<dynamic, String>(json['galleries']),
      virtualTours: List.castFrom<dynamic, String>(json['virtual_tours']),
      country: json['country'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['wallet_number'] = walletNumber;
    _data['name'] = name;
    _data['type'] = type;
    _data['unique_id'] = uniqueId;
    _data['registered_date'] = registeredDate;
    _data['address'] = address;
    _data['country_id'] = countryId;
    _data['state_id'] = stateId;
    _data['postal_code'] = postalCode;
    _data['cover_photo_url'] = coverPhotoUrl;
    _data['location_title'] = locationTitle;
    _data['location_description'] = locationDescription;
    _data['media_url'] = mediaUrl;
    _data['audio_url'] = audioUrl;
    _data['hotspot_x'] = hotspotX;
    _data['hotspot_y'] = hotspotY;
    _data['hotspot_content'] = hotspotContent;
    _data['verification'] = verification;
    _data['active'] = active;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['overview'] = overview;
    _data['ranking'] = ranking;
    _data['yearly_cost'] = yearlyCost;
    _data['galleries'] = galleries;
    _data['virtual_tours'] = virtualTours;
    _data['country'] = country;
    _data['city'] = city;
    return _data;
  }
}

class ApplicationFees {
  ApplicationFees({
    required this.id,
    required this.programId,
    required this.studentType,
    required this.amount,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String programId;
  late final String studentType;
  late final String amount;
  late final String description;
  late final String createdAt;
  late final String updatedAt;

  static ApplicationFees fromJson(Map<String, dynamic> json) {
    return ApplicationFees(
      id: json['id'],
      programId: json['program_id'],
      studentType: json['student_type'],
      amount: json['amount'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['program_id'] = programId;
    _data['student_type'] = studentType;
    _data['amount'] = amount;
    _data['description'] = description;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class AdmissionDeadlines {
  AdmissionDeadlines({
    required this.id,
    required this.programId,
    required this.semesterName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String programId;
  late final String semesterName;
  late final String description;
  late final String startDate;
  late final String endDate;
  late final String createdAt;
  late final String updatedAt;

  static AdmissionDeadlines fromJson(Map<String, dynamic> json) {
    return AdmissionDeadlines(
      id: json['id'],
      programId: json['program_id'],
      semesterName: json['semester_name'],
      description: json['description'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['program_id'] = programId;
    _data['semester_name'] = semesterName;
    _data['description'] = description;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class TuitionFees {
  TuitionFees({
    required this.id,
    required this.programId,
    required this.studentType,
    required this.paymentType,
    required this.amount,
    required this.afterScholarship,
    required this.scholarshipPercent,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String programId;
  late final String studentType;
  late final String paymentType;
  late final int amount;
  late final int afterScholarship;
  late final int scholarshipPercent;
  late final String comment;
  late final String createdAt;
  late final String updatedAt;

  static TuitionFees fromJson(Map<String, dynamic> json) {
    return TuitionFees(
      id: json['id'],
      programId: json['program_id'],
      studentType: json['student_type'],
      paymentType: json['payment_type'],
      amount: json['amount'],
      afterScholarship: json['after_scholarship'],
      scholarshipPercent: json['scholarship_percent'],
      comment: json['comment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['program_id'] = programId;
    _data['student_type'] = studentType;
    _data['payment_type'] = paymentType;
    _data['amount'] = amount;
    _data['after_scholarship'] = afterScholarship;
    _data['scholarship_percent'] = scholarshipPercent;
    _data['comment'] = comment;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
